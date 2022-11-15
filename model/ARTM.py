import ConectDB
class ARTM:
    def __init__(self) -> None:
        self.__conet= ConectDB.Conectar().getConet()

    def registrarART(self, obj):
        #recibe el objeto del tipo ART a registrar en la base
        cur = self.__conet.cursor()
        query = "INSERT INTO art VALUES(DEFAULT, " + obj.get_nombre() + ", " + obj.get_email() + ", " + str(obj.get_tel()) +")"
        cur.execute("query")
    
    def eliminarART(self, id):
        #recibe el id del ART a eliminar
        cur = self.__conet.cursor()
        query = "DELETE FROM art WHERE id_art = " + str(id)
        try:
            cur.execute(query)
            return "Se eleimino ART"
        except:
            return "No se pudo eliminar"

    def modificarART(self, id):
        #recibe el id ART para buscar y retornar los datos
        cur = self.__conet.cursor()
        query = "SELECT * FROM art WHERE id_art = " + str(id) 
        cur.execute(query)
        for x in cur:
            print(x, end="\n")

    def actualizarART(self, obj):
        #recibe el objeto ART a actualizar
        cur = self.__conet.cursor()
        query = "UPDATE art SET email = " + obj.get_email() + ", tel = "+ obj.get_tel() + ", nombre = " + obj.get_nombre() + " WHERE id_art = " + str(obj.get_id_art())
        try:
            cur.execute(query)
            return "Se actualizo ART"
        except:
            return "No se pudo actualizar ART"


