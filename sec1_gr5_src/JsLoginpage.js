
async function userLogin(username ,password) {
    let info = {
        username: username,
        password: password
    }
    console.log(info);
    const res = await fetch("http://localhost:3030/login/", { method: "post", headers: {'Content-Type': 'application/json'}, body: JSON.stringify(info) })
    // const res = await (await fetch("", {
    //     method: 'POST',
    //     headers: {
            
    //     },
    //     body: JSON.stringify({info: info})
    // })).json();
    let user = await res.data;
    console.log(res);
    console.log(res.data);
    console.log(user);
   
}
//apadij
//itcs212_1