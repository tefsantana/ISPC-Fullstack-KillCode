import ConectDB
class Empleado:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar()

    def registrarEmpleado(self, obj):
        cur = self.__conet.conexion.cursor()
        cur.execute("SHOW DATABASES")
        for x in cur:
            print(x)