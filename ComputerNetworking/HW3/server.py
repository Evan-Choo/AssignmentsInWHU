from socket import *
import datetime
import random


def invoke(para: str) -> str:
    if para == 'get time':
        return get_time()
    elif para == 'greet':
        return get_greet()


def get_time() -> str:
    return "Current time is: %s" % (datetime.datetime.now())


def get_greet() -> str:
    index: int = random.randint(1, 3)
    if index == 1:
        return "Have a nice day"
    elif index == 2:
        return "Nice to meet you"
    elif index == 3:
        return "How's going?"
    else:
        return "Random error"


# beginning of the program

server_port = 12000
server_socket: socket = socket(AF_INET, SOCK_STREAM)
server_socket.bind(('', server_port))
server_socket.listen(1)
print("The server is ready to receive")

while True:
    conn_socket, addr = server_socket.accept()
    command: str = conn_socket.recv(1024).decode()
    print(command)
    if command == 'end':
        break
    conn_socket.send(invoke(command).encode())
    conn_socket.close()


server_socket.close()
