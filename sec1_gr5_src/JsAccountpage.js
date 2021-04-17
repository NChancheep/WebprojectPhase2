function myFunction() {
  const login = localStorage.getItem('login');
  if(login)
  {
    const fName = localStorage.getItem('firstname');
    document.getElementById("fNameOut").innerHTML = fName;

    const lName = localStorage.getItem('lastname');
    document.getElementById("lNameOut").innerHTML = lName;

    const Email = localStorage.getItem('email');
    document.getElementById("EmailOut").innerHTML = Email;
    const address = localStorage.getItem('address');
    document.getElementById("addressOut").innerHTML = address;
    const age = localStorage.getItem('age');
    document.getElementById("ageOut").innerHTML = age;

  }
  else{
    alert("login first");
        location.replace("HtmlLoginpage.html");
  }
  }