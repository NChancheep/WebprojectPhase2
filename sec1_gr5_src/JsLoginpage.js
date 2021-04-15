
async function userLogin(username ,password) {
    // event.preventDefault();
    let info = {
        username: username,
        password: password
    }
    // console.log(info);
    //const res = await fetch("http://localhost:3030/login/", { method: "post", headers: {'Content-Type': 'application/json'}, body: JSON.stringify(info) })
    // const res = await (await fetch("", {
    //     method: 'POST',
    //     headers: {
            
    //     },
    //     body: JSON.stringify({info: info})
    // })).json();
    const res = await (await fetch("http://localhost:3030/login/", {
        method: 'POST',
        headers: {'Content-Type': 'application/json'}, 
        body: JSON.stringify(info) 
    })).json();
    console.log(res);
    let student = res.data;
    
   
}
//apadij
//itcs212_1