
import ConectDB
class OSM:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar().getConet()

    def registrarObraSocial(self, tel, email, nombre):
        #recibe el telefono el email y el nombre de de la obra social a agregar y la inserta en la tabla obrasocial. 
        cur = self.__conet.cursor()
        query = "INSERT INTO obrasocial VALUES(DEFAULT, " + str(tel) + ", " + email + ", " + nombre +")"
        cur.execute(query)
    
    def eliminarObraSocial(self, id):
        #recibe el id del ObraSocial a eliminar
        cur = self.__conet.cursor()
        query = "DELETE FROM obrasocial WHERE id_os = " + str(id)
        try:
            cur.execute(query)
            return "Se elimino OS"
        except:
            return "No se pudo eliminar OS"
    
    def mostrarObraSocial(self, id):
        #recibe el id ObraSocial para buscar y retornar los datos
        cur = self.__conet.cursor()
        query = "SELECT * FROM obrasocial WHERE id_os" + str(id)
        cur.execute(query)
        for x in cur:
            print(x, end="\n")
    
    def actualizarObraSocial(self, obj):
        #recibe el objeto ObraSocial a actualizar
        cur = self.__conet.cursor()
        query = "UPDATE obrasocial SET email = " + obj.get_email() + ", tel = "+ obj.get_tel() + ", nombre = " + obj.get_nombre() + " WHERE id_os = " + str(obj.get_id_os())
        try:
            cur.execute(query)
            return "Se actualizo OS"
        except:
            return "No se pudo actualizar OS"

