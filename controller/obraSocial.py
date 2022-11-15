class ObraSocial:
    def __init__(self, id_os, tel, email, nombre) -> None:
        self.id_os = id_os
        self.tel = tel
        self.email = email
        self.nombre = nombre

    def __str__(self) -> str:
        return f"Obra social: .{self.nombre}. ID: .{self.id_os}"

    #Getters
    def get_id_os(self):
        return self.id_os
    
    def get_tel(self):
        return self.tel

    def get_email(self):
        return self.email
    
    def get_nombre(self):
        return self.nombre
