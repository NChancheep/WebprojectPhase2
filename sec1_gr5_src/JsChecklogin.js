function alwayscheck() {
  const login = localStorage.getItem('login');
  if(login)
  {
    document.getElementById("showLogout").innerHTML = `<button onclick="logoutset()">LOGOUT</button>`;
  } 
  else{
    document.getElementById("showLogin").innerHTML = `<a href="HtmlLoginpage.html">LOGIN</a>`;
  } 
}

function logoutset()
{
  localStorage.clear();
  alert("logout successful");
  location.replace("HtmlLoginpage.html");
}

