# Notes on Actor Model Concurrency

- Each Actor is a Process
- Each process performs a specific task
- To tell a process to do something, you need to send it a message. The process can reply by sending back another message.
- The kinds of messages the process can act on are specific to the process itself. In other words, messages are pattern-matched.
- Other than that, processes don't share any information with other processes.

Could argue this is purer form of OO.

Can think of Actors as people who communicate by talking. We can't read each other's minds, but must talk.
