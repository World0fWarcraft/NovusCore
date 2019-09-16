#include "ClientHandler.h"

ClientHandler::ClientHandler()
    : _isRunning(false), _inputQueue(256), _outputQueue(256)
{
}

ClientHandler::~ClientHandler()
{
}

void ClientHandler::Start()
{
    if (_isRunning)
        return;

    std::thread thread = std::thread(&ClientHandler::Run, this);
    thread.detach();
}

void ClientHandler::Stop()
{
    if (!_isRunning)
        return;

    Message message;
    message.code = MSG_IN_EXIT;
    PassMessage(message);
}

void ClientHandler::PassMessage(Message& message)
{
    _inputQueue.enqueue(message);
}

bool ClientHandler::TryGetMessage(Message& message)
{
    return _outputQueue.try_dequeue(message);
}

void ClientHandler::Run()
{
    _isRunning = true;

    Timer timer;
    f32 targetDelta = 1.0f / 5;

    while (true)
    {
        f32 deltaTime = timer.GetDeltaTime();
        timer.Tick();

        if (!Update(deltaTime))
            break;

        // Wait for tick rate, this might be an overkill implementation but it has the even tickrate I've seen - MPursche
        for (deltaTime = timer.GetDeltaTime(); deltaTime < targetDelta - 0.0025f; deltaTime = timer.GetDeltaTime())
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(1));
        }

        for (deltaTime = timer.GetDeltaTime(); deltaTime < targetDelta; deltaTime = timer.GetDeltaTime())
        {
            std::this_thread::yield();
        }
    }

    // Clean up stuff here

    Message exitMessage;
    exitMessage.code = MSG_OUT_EXIT_CONFIRM;
    _outputQueue.enqueue(exitMessage);
}

bool ClientHandler::Update(f32 deltaTime)
{
    Message message;
    while (_inputQueue.try_dequeue(message))
    {
        if (message.code == -1)
            assert(false);

        if (message.code == MSG_IN_EXIT)
        {
            return false;
        }
        else if (message.code == MSG_IN_PING)
        {
            Message pongMessage;
            pongMessage.code = MSG_OUT_PRINT;
            pongMessage.message = new std::string("PONG!");
            _outputQueue.enqueue(pongMessage);
        }
    }
    return true;
}