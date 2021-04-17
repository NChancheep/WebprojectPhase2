async function search(name) {
    console.log(name);
    const res = await (await fetch("http://localhost:3030/search&/Food/" + name, {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    console.log(res.data[0]);
    res.data.forEach(Food => 
        {
            lists += `<li>[${Food.Food_Name}]</li> `;
        });
        lists += `</ul>`;
        document.getElementById("result1").innerHTML = lists;
}
async function search1(name) {
    console.log(name);
    const res = await (await fetch("http://localhost:3030/search&/Drink/" + name, {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    console.log(res.data[0]);
    res.data.forEach(Drink => 
        {
            lists += `<li>[${Drink.Drink_Name}]</li> </a>`;
        });
        lists += `</ul>`;
        document.getElementById("result2").innerHTML = lists;
}
async function search2(name) {
    console.log(name);
    const res = await (await fetch("http://localhost:3030/search&/Dessert/" + name, {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    console.log(res.data[0]);
    res.data.forEach(Dessert => 
        {
            lists += `<li>[${Dessert.Dessert_Name}]</li> </a>`;
        });
        lists += `</ul>`;
        document.getElementById("result3").innerHTML = lists;
}

async function FoodAll() {
    console.log("Clicked");
    const res = await (await fetch("http://localhost:3030/search&/Food", {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    res.data.forEach(Food => 
    {
        lists += `<li>[${Food.Food_Name}]</li> </a>`;
    });
    lists += `</ul>`;
    document.getElementById("result4").innerHTML = lists;
}


async function DrinkAll() {
    console.log("Clicked");
    const res = await (await fetch("http://localhost:3030/search&/Drink", {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    res.data.forEach(Drink => 
    {
        lists += `<li>[${Drink.Drink_Name}]</li> </a>`;
    });
    lists += `</ul>`;
    document.getElementById("result4").innerHTML = lists;
}

async function DessertAll() {
    console.log("Clicked");
    const res = await (await fetch("http://localhost:3030/search&/Dessert", {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    res.data.forEach(Dessert => 
    {
        lists += `<li>[${Dessert.Dessert_Name}]</li> </a>`;
    });
    lists += `</ul>`;
    document.getElementById("result4").innerHTML = lists;
}

async function locationAll() {
    console.log("Clicked");
    const res = await (await fetch("http://localhost:3030/search&/Branch", {
        method: 'GET'
    })).json();
    console.log(res);
    let lists = `<ul>`;
    res.data.forEach(Branch => 
    {
        lists += `<li>[${Branch.Location}]</li> </a>`;
    });
    lists += `</ul>`;
    document.getElementById("result4").innerHTML = lists;
}
function myFunction() {
    const login = localStorage.getItem('login');
    if(!login)
    {
        alert("login first");
        location.replace("HtmlLoginpage.html");
    }
    }