// Retrieve the email and password values from Local Storage
var email = localStorage.getItem("email");
var password = localStorage.getItem("password");

// If the email and password values exist in Local Storage, create a string to display the data
if (email && password) {
  var dataString = "Email: " + email + "<br>Password: " + password;
} else {
  var dataString = "No data found in local storage.";
}

// Insert the data string into the HTML document using DOM manipulation
var dataContainer = document.querySelector(".data-container");
var dataParagraph = document.createElement("p");
dataParagraph.innerHTML = dataString;
dataContainer.appendChild(dataParagraph);
