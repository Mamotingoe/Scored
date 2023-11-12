var score = 650; // Replace this with the actual score

// Get the image element
var imageElement = document.getElementById("scoreImage");

// Set the source of the image depending on the score
if (score < 580) {
  imageElement.src = "/home/mamotingoe/code/Mamotingoe/Scored/login-form/dist/dbz1.png"; // Very low
} else if (score < 670) {
  imageElement.src = "/home/mamotingoe/code/Mamotingoe/Scored/login-form/dist/dbz3.png"; // Low
} else if (score < 800) {
  imageElement.src = "/home/mamotingoe/code/Mamotingoe/Scored/login-form/dist/dbz5.png"; // Very good
} else {
  imageElement.src = "/home/mamotingoe/code/Mamotingoe/Scored/login-form/dist/dbz7.png"; // Excellent
}
