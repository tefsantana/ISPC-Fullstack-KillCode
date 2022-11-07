import ConectDB
class EmpleadoM:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar().getConet()

    def registrarEmpleado(self, obj):
        #recibe el objeto del tipo empleado empleado a registrar en la base
        cur = self.__conet.cursor()
        cur.execute("INSERT INTO empleados VALUES ('')")
    #-------------------------------------------------------------------------------
    def eliminarEmpleado(self, obj):
        #recibe el id del empleado a eliminar
        cur = self.__conet.cursor()
        query = "DELETE datos_empleado, empleado FROM datos_empleado JOIN empleado WHERE empleado.dni = " + str(obj) + ""
        if cur.execute(query):
            print("Se elimino correctamente")
        else:
            print("No se pudo eliminar")
    #-------------------------------------------------------------------------------
    def modificarEmpleado(self, id):
        #recibe el id empleado para buscar y retornar los datos
        cur = self.__conet.cursor()
        query = "SELECT * FROM empleado INNER JOIN datos_empleado WHERE empleado.id_emp = " + str(id) +""
        cur.execute(query)
        for x in cur:
            print(x, end="\n")
    #--------------------------------------------------------------------------------   
    def actualizarEmpleado(self, obj):
        #recibe el objeto empleado a actualizar
        cur = self.__conet.cursor()
        cur.execute("UPDATE")