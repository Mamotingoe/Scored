const creditScoreField = document.getElementById("creditScore");
const face = document.getElementById('face');
const eyes = document.getElementsByClassName('eye');

const handleMouseMove = event => {
    // Similar to your existing mouse move handling
    // ...
};

const handleFocusCreditScore = event => {
    // Your existing focus handling for password field
    // ...
};

const handleFocusOutCreditScore = event => {
    // Reset the face and eyes to default state
    face.style.transform = 'translateX(0)';

    for (let ball_mouth of ball_mouths) {
        eye.style.transform = `rotate(0deg)`;
    }

    // Determine the credit score range based on the entered value
    const creditScore = parseInt(creditScoreField.value);

    if (creditScore < 300) {
        // No Credit
        document.getElementById('ball').classList.add('sad');
    } else if (creditScore >= 300 && creditScore <= 579) {
        // Poor
        document.getElementById('ball').classList.add('sad');

        for (let eye of eyes) {
            eye.style.transform = `rotate(215deg)`;
        }
    } else if (creditScore >= 580 && creditScore <= 669) {
        // Fair
        // No additional changes, use default face state
    } else if (creditScore >= 670 && creditScore <= 739) {
        // Good
        face.style.transform = 'translateX(15px)';
    } else if (creditScore >= 740 && creditScore <= 799) {
        // Very Good
        face.style.transform = 'translateX(30px)';
    } else {
        // Excellent
        face.style.transform = 'translateX(30px)';

        for (let eye of eyes) {
            eye.style.transform = `rotate(100deg)`;
        }
    }
};

document.addEventListener("mousemove", event => handleMouseMove(event));
creditScoreField.addEventListener('focus', event => handleFocusCreditScore(event));
creditScoreField.addEventListener('focusout', event => handleFocusOutCreditScore(event));

document.getElementById('submit').addEventListener("mouseover", event => document.getElementById('ball').classList.toggle('look_at'));
document.getElementById('submit').addEventListener("mouseout", event => document.getElementById('ball').classList.toggle('look_at'));
