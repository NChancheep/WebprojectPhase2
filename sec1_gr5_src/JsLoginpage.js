var keepdata1; 
var keepdata2; 
async function userLogin(username, password) {
    // event.preventDefault();
    let info = {
        username: username, //apadij
        password: password //itcs212_1
    }
    const res = await (await fetch("http://localhost:3030/userlogin/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(info)
    })).json();
    console.log(res);
    keepdata = res;
    if (res.error) {
        alert("Username or password Incorrect");
    }
    else{
        alert("Welcome back "+res.data.firstname+" "+res.data.lastname);
        location.replace("HtmlAccountpage.html");
    }
}

async function adminLogin(username, password) {
    // event.preventDefault();
    let info = {
        username: username, //LeviAKM
        password: password //2512820
    }
    console.log(username, password);
    const res = await (await fetch("http://localhost:3030/adminlogin/", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(info)
    })).json();
    console.log(res);
    if (res.error) {
        alert("Username or password Incorrect");
    }
    else{
        alert("Welcome back "+res.data.firstname+" "+res.data.lastname);
        location.replace("HtmlAdminpage.html");
    }
}

