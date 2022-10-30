import ConectDB
class EmpleadoM:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar().getConet()

    def registrarEmpleado(self, obj):
        #recibe el objeto del tipo empleado empleado a registrar en la base
        cur = self.__conet.cursor()
        cur.execute("INSERT INTO empleados VALUES ('')")
    def eliminarEmpleado(self, id):
        #recibe el id del empleado a eliminar
        cur = self.__conet.cursor()
        cur.execute("DELETE FROM empleados WHERE")
    def modificarEmpleado(self, id):
        #recibe el id empleado para buscar y retornar los datos
        cur = self.__conet.cursor()
        cur.execute("SELECT * FROM empleados JOIN")
    def actualizarEmpleado(self, obj):
        #recibe el objeto empleado a actualizar
        cur = self.__conet.cursor()
        cur.execute("UPDATE")