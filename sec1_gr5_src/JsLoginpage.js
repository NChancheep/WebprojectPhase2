var keepdata; 

async function userLogin(username, password) {
    // event.preventDefault();
    let info = {
        username: username, //apadij
        password: password //itcs212_1
    }
    const res = await (await fetch("http://localhost:3030/login/", {
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
        alert("Welcome back "+res.data.username);
        location.replace("");
    }
}

