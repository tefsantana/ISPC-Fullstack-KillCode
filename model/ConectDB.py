#Conexion con la base de datos. 
import mysql.connector


class Conectar():

    def _init_(self) -> None:
        try:
            self.conexion = mysql.connector.connect(
                host = 'localhost',
                port = 3306,
                user = 'root',
                password = '123456',
                db = 'reciboHDB'

            )
        except mysql.connector.Error as descripcionError:
            print("Error en la conexion: ", descripcionError, sep="")