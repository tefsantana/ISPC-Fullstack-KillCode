class Empresa:
    def __init__(self, id_empre, id_paq, cuit, cp, nombre, d_calle, d_numero, provincia, ciudad) -> None:
        self.id_empre = id_empre
        self.id_paq = id_paq
        self.cuit = cuit
        self.cp = cp
        self.nombre = nombre
        self.d_calle = d_calle
        self.d_num = d_numero
        self.provincia = provincia
        self.ciudad = ciudad
    
    def __str__(self) -> str:
        return f"Empresa: {self.nombre}.\n CUIT: {self.cuit}"
      
    #Getters
    def get_id_empre(self):
        return self.id_empre
    
    def get_id_paq(self):
        return self.id_paq
    
    def get_cuit(self):
        return self.cuit
    
    def get_cp(self):
        return self.cp
    
    def get_nombre(self):
        return self.nombre

    def get_d_calle(self):
        return self.d_calle
    
    def get_d_num(self):
        return self.d_numero
    
    def get_provincia(self):
        return self.provincia
    
    def get_ciudad(self):
        return self.ciudad
        