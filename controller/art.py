class ART:
    def __init__(self, id_art, nombre, email, tel) -> None:
        self.id_art = id_art
        self.nombre = nombre
        self.email = email
        self.tel = tel
    
    def __str__(self) -> str:
        return f"Nombre de ART: .{self.art}. ID: .{self.id_art}"
    
    #Getters
    def get_id_art(self):
        return self.id_art

    def get_nombre(self):
        return self.nombre
    
    def get_email(self):
        return self.email
        
    def get_tel(self):
        return self.tel