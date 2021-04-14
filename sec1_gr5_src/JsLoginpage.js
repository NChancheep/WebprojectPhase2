async function userLogin(user, pass) {
    const res = await (await fetch("http://localhost:3030/", {
        method: 'GET'
    })).json();
    console.log(res);
    let student = res.data;
}

async function selectById(id) {
    const res = await (await fetch("http://localhost:3030/login/" + id, {
        method: 'GET'
    })).json();
    console.log(res);
    let user = res.data;
    document.getElementById("byId").innerHTML =
        `[Name: ${user.Firstname} ${user.Lastname} | Date of Birth: ${student.DOB.substring(0,10)} | Mobile: ${student.Mobilephone}]`;
}