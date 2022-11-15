
import ConectDB
class EmpresaM:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar().getConet()

    def registrarEmpresa(self, obj):
        #recibe el objeto del tipo empresa a registrar en la base
        cur = self.__conet.cursor()
        query = "INSERT INTO datos_empresa VALUES (%s, %s, %s, %s, %s)"
        values = (obj.get_cuit(), obj.get_cp(), obj.get_nombre(), obj.d_calle, obj.d_num())
        query2 = "INSERT INTO empresa VALUES (%s, %s, %s"
        values2 = (obj.get_id_empre(), obj.get_id_paq, obj.get_cuit)
        try:
            cur.execute(query, values)
            cur.execute(query2, values2)
        except:
            return "Alguno de los datos de la empresa no se pudo dar de alta"

    def eliminarEmpresa(self, obj):
        #recibe el objeto empresa a eliminar
        cur = self.__conet.cursor()
        query = "DELETE datos_empresa, empresa FROM datos_empresa JOIN empresa WHERE empresa.cuit = " + str(obj.get_cuit()) + ""
        if cur.execute(query):
            print("Se elimino correctamente")
        else:
            print("No se pudo eliminar")
    
    def mostrarEmpresa(self, cuit):
        #recibe el id de la empresa para buscar y retornar los datos
        cur = self.__conet.cursor()
        query = "SELECT * FROM empresa JOIN datos_empresa WHERE empresa.cuit = " + str(cuit) +""
        cur.execute(query)
        for x in cur:
            print(x, end="\n")
    
    def actualizarEmpresa(self, obj):
        #recibe el objeto empleado a actualizar
        cur = self.__conet.cursor()
        query = "UPDATE datos_empresa SET cp = " + str(obj.get_cp()) + ", nombre = " + str(obj.get_nombre()) + ", d_calle = " + obj.get_d_calle + ", d_num = " + str(obj.get_d_num) + " WHERE cuit = " + str(obj.get_cuit) +""
        if cur.execute(query):
            return "Se actualizo los datos de la empresa"
        else:
            return "No se pudieron actualziar los datos"
    
    def contratarPaquete(self, emp, paq):
        #recibe id del paquete para actualizarlo en la empresa segun el id de la empresa otorgada 
        cur = self.__conet.cursor()
        query = "UPDATE empresa SET id_paq = " + str(paq) + "WHERE id_empre = " + str(emp) +""
        try:
            cur.execute(query)
            return "Se actualizo el paquete"
        except:
            return "No se pudo actualizar el paquete contratado"            
