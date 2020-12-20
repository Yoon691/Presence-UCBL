var urlApi = "https://192.168.75.61/api/v3"



function login(){
    console.log(document.getElementById("loginIn").value);
    const userData = {
        "login": document.getElementById("loginIn").value,
        "nom": document.getElementById("nameIn").value,
        "admin":false
    };
    console.log("data"+ userData);
    fetch(urlApi+'/users/login',{
        method: "POST",
        headers: {'content-type' : 'application/json'},
        body: JSON.stringify(userData)
    })
        .then(response => {
            console.log("LOGIN REUSSI");
            window.token=response.headers.get("Authorization");
            console.log(token);
            getLoginUser(token);
            getInfoscopmte(getLoginUser(token));
            passagesEncours(token);
            window.location="#monCompte";
        })
        .catch(error => console.log(error));

}


function logout(){
    console.log("deconnexion");
    fetch(urlApi+ '/users/logout', {
        methode: "POST",
        headers :{  'Authorization' : token,
                        'Accept' : "application/json"},
        crossDomain: true,

    })
        .then(response => {
            console.log("token avant " + token);
            window.token=null;
            console.log("token aprés " + token);
            window.location="#index";
        })
        .catch(error => console.log(error));
    return false;
}




function getInfoscopmte(login) {

    console.log("LOGIN"+ login);
    fetch(urlApi+'/users/'+login,{
        method: "GET",
        headers :{'Authorization' : token,
                    'Accept': "application/json"
                },
    })
        .then(response => {
        console.log(response);
        return response.json();
        })


        .then(data => {
            console.log(data);
            window.currentUser= data;
            console.log(currentUser);
            view('profileTemplate',currentUser, 'compteListe');

        })
        .catch(error => console.error(error));


}


function passagesEncours(token) {
    console.log(token);
    var login = getLoginUser(token);
    console.log(login);
    fetch(urlApi + '/passages/byUser/' + login + '/enCours', {
        method: "GET",
        headers: {
            'Authorization': token,
            'Accept': "application/json"
        },
    })
        .then(response => {
            console.log(response);
            return response.json();
        })

        .then(data => {
            console.log(data);
            window.currentPassageEncours = data;
            console.log(currentPassageEncours);

            view('passage-template', currentPassageEncours, 'passageEncour');

        })
        .catch(error => console.error(error));
}

function entreeSalle(){
    console.log(document.getElementById("salle").value);
    const salleData = {
        "user": document.getElementById("loginIn").value,
        "salle": document.getElementById("salle").value,
    };

    fetch(urlApi+'/passages',{
        method: "POST",
        headers: {'content-type' : 'application/json',
            'Authorization' : token,
        },
        crossDomain: true,
        body: JSON.stringify(salleData)
    })
        .then(response => {
            console.log("Entrée REUSSI");
            // window.token=response.headers.get("Authorization");
            console.log(token);
            passages(token);
            window.location="#passages";

        })
        .catch(error => console.log(error));
}

function sortieSalle(){
    console.log(document.getElementById("salle").value);
    var now = new Date();
    const salleSortieData = {
        "user": document.getElementById("loginIn").value,
        "salle": document.getElementById("salleS").value,
        "dateSortie" : now
    };

    fetch(urlApi+'/passages',{
        method: "POST",
        headers: {'content-type' : 'application/json',
            'Authorization' : token,
        },
        crossDomain: true,
        body: JSON.stringify(salleSortieData)
    })
        .then(response => {
            console.log("sortie REUSSI");
            // window.token=response.headers.get("Authorization");
            console.log(token);
            passages(token);
            window.location="#passages";

        })
        .catch(error => console.log(error));
}

function passages(token) {
    console.log(token);
    var login = getLoginUser(token);
    console.log(login);
    fetch(urlApi + '/passages/byUser/' + login, {
        method: "GET",
        headers: {
            'Authorization': token,
            'Accept': "application/json"
        },
    })
        .then(response => {
            console.log(response);
            return response.json();
        })

        .then(data => {
            console.log(data);
            window.currentPassage = data;
            view('passages-template', currentPassage, 'passagesList');

        })
        .catch(error => console.error(error));
}



function  parseJwt(mytokent){
    let token = {};
    token.raw = mytokent;
    token.headers = JSON.parse(window.atob(mytokent.split('.')[0]));
    token.payload = JSON.parse(window.atob(mytokent.split('.')[1]));
    return (token)
}

function view(templateID, data, idRes){
    let template = $('#'+templateID).html();
    Mustache.parse(template);
    let html = Mustache.render(template,data);
    $('#'+idRes).html(html);
}

function getIdFromUri(uri){
    let splitedUri = uri.split("/");
    return splitedUri[splitedUri.length - 1];
}
function getLoginUser(token) {
    let monToken = token.replace("Bearer", "");
    let sub = parseJwt(monToken).payload.sub;
    let userlogin = getIdFromUri(sub);
    console.log("USERID"+userlogin);
    return userlogin;
}
function displayNavbarConnection() {

    $('#menu').on("click", function () {
        console.log("BOUTTON MENU FONCTIONELLE");
        $('#menupd').slideToggle('blink');
    });
    $('#nom').attr('contentEditable', 'true')

}


$(document).ready(function() {

    /* ############## INIT ############## */
    window.addEventListener('hashchange', () => { show(window.location.hash); });
    function show(hash) {
        $('.active').removeClass('active').addClass('inactive');
        $(hash).removeClass('inactive').addClass('active');

    }


    window.displayNavbarConnection();
});


