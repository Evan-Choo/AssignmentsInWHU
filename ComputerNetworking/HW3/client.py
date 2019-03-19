from socket import *


def invoke(command: str) -> str:
    if command == 'get time':
        return get_time()
    if command == 'greet':
        return get_greet()
    elif command == 'help':
        return '(\'get time\': get current time) (\'greet\': get a greet) (\'end\': end the program)'
    else:
        return 'command not found'


def get_time() -> str:
    client_socket.send("get time".encode())
    current_time: str = client_socket.recv(1024)
    return current_time


def get_greet() -> str:
    client_socket.send("greet".encode())
    greet: str = client_socket.recv(1024)
    return greet


def end_connection():
    client_socket.send("end".encode())


# beginning of the program

server_name: str = '155.138.212.239'
server_port: int = 12000

client_socket: socket = socket(AF_INET, SOCK_STREAM)
client_socket.connect((server_name, server_port))

sentence: str = input('Input command (\'help\' to see all commands): ')

while True:
    if sentence == 'end':
        end_connection()
        break
    print(invoke(sentence))
    sentence: str = input('Input command (\'help\' to see all commands): ')


client_socket.close()
