function validate() {

    var usernameempty = 0;
    var passwordempty = 0;
    var confirmpassempty = 0;
    var emailempty = 0;
    var contactempty = 0;
    var element;
    var span;
    var password;
    var confirmpassword;
    var bothpasswordsame = 0;

    element = document.getElementById("username");
    span = document.getElementById("userspan");
    if (element.value === "") {
        span.style.visibility = "visible";
        usernameempty = 1;
    } else {

        span.style.visibility = "hidden";
        usernameempty = 0;
    }


    element = document.getElementById("password");
    password = element.value;
    span = document.getElementById("passwordspan");
    if (element.value === "") {
        span.style.visibility = "visible";
        passwordempty = 1;
    } else {

        span.style.visibility = "hidden";
        passwordempty = 0;
    }

    element = document.getElementById("confirmpass");
    confirmpassword = element.value;
    span = document.getElementById("confirmspan");
    if (element.value === "") {
        span.style.visibility = "visible";
        confirmpassempty = 1;
    } else {

        span.style.visibility = "hidden";
        confirmpassempty = 0;
    }

    span = document.getElementById("passwordmatchspan");
    if (password !== confirmpassword) {
        span.style.visibility = "visible";
        bothpasswordsame = 1;
    } else {
        span.style.visibility = "hidden";
        bothpasswordsame = 0;
    }


    element = document.getElementById("email");
    span = document.getElementById("emailspan");
    if (element.value === "") {
        span.style.visibility = "visible";
        emailempty = 1;
    } else {

        span.style.visibility = "hidden";
        emailempty = 0;
    }

    element = document.getElementById("contact");
    span = document.getElementById("contactspan");
    if (element.value === "") {
        span.style.visibility = "visible";
        contactempty = 1;
    } else {

        span.style.visibility = "hidden";
        contactempty = 0;
    }

    if (usernameempty === 0 && passwordempty === 0 && emailempty === 0 && contactempty === 0 && confirmpassempty === 0 && bothpasswordsame === 0) {
        return true;
    } else {
        return false;
    }

}

function initMap() {
    var mapDiv = document.getElementById('map');
    var map = new google.maps.Map(mapDiv, {
        center: {lat: 44.540, lng: -78.546},
        zoom: 8
    });
}




function hide(element) {
    document.getElementById(element).style.display = 'none';
}


function show(element) {
    document.getElementById(element).style.display = 'block';

}
