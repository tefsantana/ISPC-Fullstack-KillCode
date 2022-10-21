function redirectToRegister() {
    window.location.href = "register.html";
}

function goToSuccessfulRegister() {
    window.location.href = "success-register.html";
}

function disableEnterButton() {
    document.getElementById("enterSite").disabled = true;
}

function login(){
    let email = document.getElementById("inputEmail").value; 
    let password = document.getElementById("inputPass").value; 
    let valid = false;
    if ((email == "testusuario1@gmail.com" && password == "HolaMundo") || (email == "testusuario2@gmail.com" && password == "HolaMundo")) { 
        valid = true;
    }
    return valid;
} 

document.addEventListener("click", (e) => {
    if (!e.target.matches("#enterSite")) return false;
    debugger;
    if (login()) {
        window.location.href = "index.html";
    }
    else {
        alert("Usuario o contraseña incorrectos");
    }
});
