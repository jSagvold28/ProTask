a// Retrieve the email, password, and profile picture values from Local Storage
var email = localStorage.getItem("email");
var password = localStorage.getItem("password");
var profilePic = localStorage.getItem("profile-pic");

// If the email and password values exist in Local Storage, create a string to display the data
if (email && password) {
  var dataString = "Email: " + email + "<br>Password: " +
    '<span id="password">' + password + '</span>' +
    ' <button id="toggle-password" onclick="togglePasswordVisibility()">👁️</button>';
  if (profilePic) {
    var profilePicString = "<br>Profile picture: <img src='" + profilePic + "' alt='Profile picture'>";
    dataString += profilePicString;
  }
} else {
  var dataString = "No data found in local storage.";
}

// Insert the data string into the HTML document using DOM manipulation
var dataContainer = document.querySelector(".data-container");
var dataParagraph = document.createElement("p");
dataParagraph.innerHTML = dataString;
dataContainer.appendChild(dataParagraph);

function togglePasswordVisibility() {
  var passwordSpan = document.getElementById("password");
  var toggleButton = document.getElementById("toggle-password");
  if (passwordSpan.style.display === "none") {
    passwordSpan.style.display = "inline";
    toggleButton.innerHTML = "🙈";
  } else {
    passwordSpan.style.display = "none";
    toggleButton.innerHTML = "👁️";
  }
}

alert("MESSAGE FROM PROTASK: Currently you are unable to see the profile picture that you added when signing up, that will be coming later.");
