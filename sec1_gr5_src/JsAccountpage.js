function myFunction() {
    const fName = localStorage.getItem('firstname');
    document.getElementById("fNameOut").innerHTML = fName;
    const Email = localStorage.getItem('email');
    document.getElementById("EmailOut").innerHTML = Email;
    const address = localStorage.getItem('address');
    document.getElementById("addressOut").innerHTML = address;
    const age = localStorage.getItem('age');
    document.getElementById("ageOut").innerHTML = age;
  }