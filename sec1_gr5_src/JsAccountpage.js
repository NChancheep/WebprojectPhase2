function myFunction() {
    const fName = localStorage.getItem('firstname');
    document.getElementById("fNameOut").innerHTML = fName;
  }