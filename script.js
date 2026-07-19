let nameValid = false;
let emailValid = false;
let passwordValid = false;
let confirmValid = false;

function validateName(){

    let name = document.getElementById("fullname").value;
    let msg = document.getElementById("nameMsg");

    let pattern = /^[A-Za-z ]+$/;

    if(pattern.test(name) && name.length >= 3){
        msg.innerHTML = "✅ Valid Name";
        msg.style.color = "green";
        nameValid = true;
    }
    else{
        msg.innerHTML = "❌ Only letters allowed";
        msg.style.color = "red";
        nameValid = false;
    }

    enableButton();
}

function validateEmail(){

    let email = document.getElementById("email").value;
    let msg = document.getElementById("emailMsg");

    let pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(pattern.test(email)){
        msg.innerHTML = "✅ Valid Email";
        msg.style.color = "green";
        emailValid = true;
    }
    else{
        msg.innerHTML = "❌ Invalid Email";
        msg.style.color = "red";
        emailValid = false;
    }

    enableButton();
}

function checkPassword(){

    let password = document.getElementById("password").value;
    let message = document.getElementById("message");
    let bar = document.getElementById("strength-bar");

    let score = 0;

    if(password.length >= 8) score++;
    if(/[A-Z]/.test(password)) score++;
    if(/[a-z]/.test(password)) score++;
    if(/[0-9]/.test(password)) score++;
    if(/[@#$%^&*!]/.test(password)) score++;

    if(score <= 2){
        bar.style.width="30%";
        bar.style.background="red";
        message.innerHTML="🔴 Weak Password";
        message.style.color="red";
        passwordValid = false;
    }
    else if(score <= 4){
        bar.style.width="70%";
        bar.style.background="orange";
        message.innerHTML="🟡 Medium Password";
        message.style.color="orange";
        passwordValid = false;
    }
    else{
        bar.style.width="100%";
        bar.style.background="green";
        message.innerHTML="🟢 Strong Password";
        message.style.color="green";
        passwordValid = true;
    }

    checkConfirmPassword();
    enableButton();
}

function checkConfirmPassword(){

    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirm_password").value;
    let msg = document.getElementById("confirmMsg");

    if(password === confirm && confirm !== ""){
        msg.innerHTML = "✅ Password Matched";
        msg.style.color = "green";
        confirmValid = true;
    }
    else{
        msg.innerHTML = "❌ Password Not Matched";
        msg.style.color = "red";
        confirmValid = false;
    }

    enableButton();
}

function enableButton(){

    let btn = document.getElementById("registerBtn");

    if(nameValid && emailValid && passwordValid && confirmValid){
        btn.disabled = false;
    }
    else{
        btn.disabled = true;
    }
}