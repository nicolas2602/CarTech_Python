import mysql.connector as con
from mysql.connector import Error

servidor = "localhost"
usuario = "root"
senha = "admin"
bd = "login"

try:
    conexao = con.connect(host=servidor, user=usuario, password=senha, database=bd)

    cursor = conexao.cursor()

    def fechar():
        cursor.close()
        conexao.close()

except Error as erro:
    print(f"Erro de conexão: {erro}")