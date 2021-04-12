async function userLogin(user, pass) {
    const res = await (await fetch("http://localhost:3030/", {
        method: 'GET'
    })).json();
    
    
}