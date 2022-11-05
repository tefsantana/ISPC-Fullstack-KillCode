import json

class Empleado:

    def __init__(self, id, password, work_role, dni, name, surname, age, personal_email, work_email, personal_phone, work_phone, home_address, work_address, postal_code, city, province, country, sex, cuil):
        self.id = id
        self.password = password
        self.work_role = work_role
        self.dni = dni
        self.name = name
        self.surname = surname
        self.age = age
        self.personal_email = personal_email
        self.work_email = work_email
        self.personal_phone = personal_phone
        self.work_phone = work_phone
        self.home_address = home_address
        self.work_address = work_address
        self.postal_code = postal_code
        self.city = city
        self.province = province
        self.country = country
        self.sex = sex
        self.cuil = cuil

    def __str__(self):
        return f"Empleado: {self.name + self.surname}.\nLegajo: {self.id}"

    # Getters

    def get_id(self):
        return self.id
    
    def get_password(self):
        return self.password
    
    def get_sex(self):
        return self.sex

    def get_work_role(self):
        return self.work_role
    
    def get_dni(self):
        return self.dni
    
    def get_name(self):
        return self.name
    
    def get_surname(self):
        return self.surname
    
    def get_age(self):
        return self.age
    
    def get_personal_email(self):
        return self.personal_email
    
    def get_work_email(self):
        return self.work_email
    
    def get_personal_phone(self):
        return self.personal_phone
    
    def get_work_phone(self):
        return self.work_phone
    
    def get_home_address(self):
        return self.home_address
    
    def get_work_address(self):
        return self.work_address
    
    def get_postal_code(self):
        return self.postal_code
    
    def get_city(self):
        return self.city
    
    def get_province(self):
        return self.province
    
    def get_country(self):
        return self.country
    
    def get_cuil(self):
        return self.cuil

    @classmethod
    # Método por el cual se maneja el login de los empleados.
    def login(self):
        print("Login")
    
    @classmethod
    # Método por el cual se maneja el registro de los empleados.
    def registro(self):
        print("Registro")
    
    @classmethod
    # Método por el cual se guarda el POST / respuesta del front cuando presiona el botón de "Firmar" en el recibo para luego enviárselo a la BBDD.
    def firmarRecibo(self):
        print("Firmar recibo")
    
    @classmethod
    # Método por el cual se devuelve al front el GET / respuesta de la BBDD con los datos NO sensibles del empleado para su uso.
    def brindarDatosPersonales(self):
        # Acá se transformaría en un objeto lo recibido por la BBDD. Solamente los datos que necesitemos. Por ahora hardcodeamos.
        datos_personales = {
            "name": "Juan",
            "surname": "Perez",
            "age": 30,
            "sex": "Masculino",
            "personal_email": "fulano@gmail.com",
            "work_email": "fulano@google.com",
            "personal_phone": "123456789",
            "work_phone": "987654321",
            "home_address": "Calle Falsa 123",
            "work_address": "Otra Calle Falsa 123",
            "postal_code": "1234",
            "city": "CABA",
            "province": "CABA",
            "country": "Argentina",
        }
        datos_personales_json = json.dumps(datos_personales, indent=2)
        return datos_personales_json
    
    @classmethod
    def elegirObraSocial(self):
        print("Elegir obra social")