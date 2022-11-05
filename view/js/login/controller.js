let password = "HolaMundo";
let email = "testusuario1@gmail.com";
let enterSiteButton = document.getElementById("enter-site");

function redirectToRegister() {
    window.location.href = "register.html";
}

function goToSuccessfulRegister() {
    window.location.href = "success-register.html";
}

function goToChangePassword() {
    window.location.href = "change-password.html";
}

function goToSuccessfulChangePassword() {
    window.location.href = "success-change-password.html";
}

function verifyLogin(email, password){

    // Get the value 'Email' from the form and test it.
    let emailInput = document.getElementById("inputEmail").value;
    let alertMessageEmail = document.getElementById("alert-msg-email");
    let successEmail = false;
    if (!(/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(emailInput))) {
        alertMessageEmail.innerHTML = "El correo electrónico ingresado no es válido.";
        alertMessageEmail.classList.remove("disabled");
        alertMessageEmail.ariaDisabled = false;
    }
    else {
        alertMessageEmail.classList.add("disabled");
        alertMessageEmail.ariaDisabled = true;
        successEmail = true;
    }

    // Get the value 'Password' from the form and test it.
    let passwordInput = document.getElementById("inputPass").value;
    let alertMessagePassword = document.getElementById("alert-msg-password");
    let successPass = false;
    if (!(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(passwordInput))) {
        alertMessagePassword.innerHTML = "La contraseña ingresada no es válida.";
        alertMessagePassword.classList.remove("disabled");
        alertMessagePassword.ariaDisabled = false;
    }
    else {
        alertMessagePassword.classList.add("disabled");
        alertMessagePassword.ariaDisabled = true;
        successPass = true;
    }

    // If the email and password are correct, the button is enabled.
    if (successEmail && successPass) {
        enterSiteButton.classList.remove("disabled");
        enterSiteButton.ariaDisabled = false;
    }
    
    let valid = false;
    if ((emailInput == email && passwordInput == password)) { 
        valid = true;
    }
    return valid;
}

function verifySecurityQuestions() {
    let answer1 = document.getElementById("first-security-question").value;
    let answer2 = document.getElementById("second-security-question").value;
    let alertMessage = document.getElementById("alert-msg-security");
    let valid = false;
    if (answer1.toLowerCase() === "coco" && answer2.toLowerCase() === "azul") {
        valid = true;
    }
    else {
        alertMessage.innerHTML = "Los datos ingresados son incorrectos.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
    }
    return valid;
}

function verifyNewPassword() {
    let password = document.getElementById("new-password").value;
    let repeat_password = document.getElementById("repeat-new-password").value;
    let alertMessage = document.getElementById("alert-msg");

    if ((!(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(password))) || (!(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/.test(repeat_password)))) {
        alertMessage.innerHTML = "La contraseña ingresada no es válida. Debe contener al menos 8 caracteres, una mayúscula, una minúscula y un número.";
        alertMessage.classList.remove("disabled");
        alertMessage.ariaDisabled = false;
        return false;
    }
    else if (password === repeat_password) {
        return true
    }
}

document.addEventListener("click", (e) => {
    if (!e.target.matches("#validate-security-questions")) return false;
    if (verifySecurityQuestions()) {
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
    if (verifyLogin(email, password)) {
        window.location.href = "index.html";
    }
    else {
        alert("Usuario o contraseña incorrectos");
    }
});
