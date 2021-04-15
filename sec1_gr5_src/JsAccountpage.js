function myFunction() {
    const fName = localStorage.getItem('firstname');
    document.getElementById("fNameOut").innerHTML = fName;
    const Email = localStorage.getItem('email');
    document.getElementById("EmailOut").innerHTML = Email;
  }