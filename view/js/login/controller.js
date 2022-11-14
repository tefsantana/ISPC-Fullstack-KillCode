// Variables hardcodeadas y constantes necesarias.

let users = [
    {
        email: "testusuario1@gmail.com",
        password: "HolaMundo1",
        securityQuestion: "coco"
    }
]

const enterSiteButton = document.getElementById("enter-site");

// Funciones de redirección.

function redirectToRegister() {
    window.location.href = "register.html";
}

function goToSuccessfulRegister() {
    window.location.href = "success-register.html";
}

function goToChangePassword(userEmail) {
    window.location.href = "change-password.html";
}

function goToSuccessfulChangePassword() {
    window.location.href = "success-change-password.html";
}

// Funciones para verificar los inputs de los form.

function newUserRegistry() {

    debugger;
    // Variables.
    let dni = document.getElementById("dni").value;
    let names = document.getElementById("names").value;
    let emailInput = document.getElementById("inputEmail3").value;
    let passwordInput = document.getElementById("inputPass2").value;
    let answer1 = document.getElementById("first-security-question2").value;

    // Alertas de mensaje por errores en los campos (validación)
    let alertMessageDni = document.getElementById("alert-msg-dni");
    let alertMessageNames = document.getElementById("alert-msg-names");
    let alertMessageEmail = document.getElementById("alert-msg-email3");
    let alertMessagePassword = document.getElementById("alert-msg-password2");

    // Validación de campos bien insertados.
    let exists = false;
    let successfulEmail = false;
    let successfulDNI = false;
    let successfulPass = false;
    let successfulNames = false;

    //Estructura de objeto del nuevo usuario en registro.
    let userObject = {
        email: emailInput,
        password: passwordInput,
        securityQuestion: answer1
    }

    users.find(function(user) {
        return (user.email == emailInput) ? exists = true : exists = false;
    });

    // Validación del email (si existe también es rechazado)
    if (exists) {
        alertMessageEmail.innerHTML = "El correo electrónico ingresado ya existe.";
        alertMessageEmail.classList.remove("disabled");
        alertMessageEmail.ariaDisabled = false;
    }
    else {
        if (!(/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(emailInput))) {
            alertMessageEmail.innerHTML = "El correo electrónico ingresado no es válido.";
            alertMessageEmail.classList.remove("disabled");
            alertMessageEmail.ariaDisabled = false;
        }
        else {
            alertMessageEmail.classList.add("disabled");
            alertMessageEmail.ariaDisabled = true;
            successfulEmail = true;
        }
    }

    // Validación del DNI ingresado.
    if (/^[0-9]{1,3}\.?[0-9]{3,3}\.?[0-9]{3,3}$/.test(dni)) {
        alertMessageDni.classList.add("disabled");
        alertMessageDni.ariaDisabled = true;
        successfulDNI = true;
    }
    else {
        alertMessageDni.innerHTML = "El DNI ingresado no es válido.";
        alertMessageDni.classList.remove("disabled");
        alertMessageDni.ariaDisabled = false;
    }

    // Validación de los nombres ingresados.
    if (names == "" || names == null) {
        alertMessageNames.innerHTML = "Debe ingresar su nombre y apellido. No se permiten números.";
        alertMessageNames.classList.remove("disabled");
        alertMessageNames.ariaDisabled = false;
    }
    else {
        alertMessageNames.classList.add("disabled");
        alertMessageNames.ariaDisabled = true;
        successfulNames = true;
    }

    // Validación de la contraseña
    if (!(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(passwordInput))) {
        alertMessagePassword.innerHTML = "La contraseña ingresada no es válida.";
        alertMessagePassword.classList.remove("disabled");
        alertMessagePassword.ariaDisabled = false;
    }
    else {
        alertMessagePassword.classList.add("disabled");
        alertMessagePassword.ariaDisabled = true;
        successfulPass = true;
    }

    if (successfulEmail && successfulDNI && successfulPass && successfulNames) {
        users.push(userObject);
        localStorage.setItem('users', users);
        goToSuccessfulRegister();
    }
}

function verifyLogin(){

    // Inicializo variables.
    let emailInput = document.getElementById("inputEmail1").value;
    let passwordInput = document.getElementById("inputPass").value;
    let alertMessage = document.getElementById("alert-msg");
    let validEmail = false;
    let validPass = false;

    for (let i = 0; i < users.length; i++) {
        if (users[i].email == emailInput) {
            validEmail = true;
        }
        if (users[i].password == passwordInput) {
            validPass = true;
        }
    }

    // Si el email y contraseña ingresados no coinciden con los existentes, muestra mancheta roja de error.
    if ((validEmail == false || validPass == false) || (emailInput == "" || passwordInput == "")) {
        alertMessage.innerHTML = "Los datos ingresados son incorrectos.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
    }

    if (validEmail == true && validPass == true) {
        window.location.href = "index.html";
    }
}

function verifySecurityQuestions() {
    let answer1 = document.getElementById("first-security-question").value;
    let emailInput = document.getElementById("inputEmail2").value;
    let alertMessage = document.getElementById("alert-msg-security");
    let userObject = {
        email: emailInput,
        valid: false
    }

    users.find(function(user) {
        return (user.email == emailInput && user.securityQuestion == answer1) ? userObject.valid = true : userObject.valid = false;
    });
    if (!userObject.valid) {
        alertMessage.innerHTML = "Los datos ingresados son incorrectos.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
    }
    return userObject;
}

function verifyNewPassword() {
    // Verifica si son correctos los inputs de la nueva contraseña y la repetición de la nueva contraseña, a la vez que los compara.
    let password = document.getElementById("new-password").value;
    let repeat_password = document.getElementById("repeat-new-password").value;
    let alertMessage = document.getElementById("alert-msg");
    let testPass = (/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(password));
    let testRepeatedPass = (/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(repeat_password));

    if ((!(testRepeatedPass && testPass)) && (password == repeat_password)) {
        alertMessage.innerHTML = "La contraseña ingresada no es válida.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
        return false;
    }
    else if (password == repeat_password && testRepeatedPass && testPass) {
        return true;
    }
    else if (password != repeat_password) {
        alertMessage.innerHTML = "Las contraseñas no coinciden.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
        return false;
    }
}

// Eventos de Click en los botones.

document.addEventListener("click", (e) => {
    if (!e.target.matches("#validate-security-questions")) return false;
    else if (verifySecurityQuestions().valid) {
        let userEmail = verifySecurityQuestions().email;
        goToChangePassword();
    }
});

document.addEventListener("click", (e) => {
    if (!e.target.matches("#confirm-change-password-btn")) return false;
    if (verifyNewPassword()) {
        goToSuccessfulChangePassword();
    }
});

document.addEventListener("click", (e) => {
    if (!e.target.matches("#enter-site")) return false;
    verifyLogin();
});
