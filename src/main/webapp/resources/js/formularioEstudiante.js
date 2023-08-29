document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    form.addEventListener("submit", function (event) {
        if (!validateForm()) {
            event.preventDefault();
        }
    });

    function validateForm() {
        const name = document.querySelector('[name="name"]').value.trim();
        const lastName = document.querySelector('[name="lastName"]').value.trim();
        const email = document.querySelector('[name="email"]').value.trim();
        const rut = document.querySelector('[name="rut"]').value.trim();
        const age = document.querySelector('[name="age"]').value.trim();
        const lastGradeStudied = document.querySelector('[name="lastGradeStudied"]').value.trim();
        const phoneNumber = document.querySelector('[name="phoneNumber"]').value.trim();

        const nameRegex = /^[A-Za-z\s]+$/;
        const rutRegex = /^[0-9]+-[0-9kK]{1}$/;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        let isValid = true;

        if (!name || !name.match(nameRegex)) {
            showError("name", "Nombre no válido");
            isValid = false;
        }

        if (!lastName || !lastName.match(nameRegex)) {
            showError("lastName", "Apellido no válido");
            isValid = false;
        }

        if (!email || !email.match(emailRegex)) {
            showError("email", "Correo electrónico no válido");
            isValid = false;
        }

        if (!rut || !rut.match(rutRegex)) {
            showError("rut", "RUT no válido");
            isValid = false;
        }

        if (!age || isNaN(age)) {
            showError("age", "Edad no válida");
            isValid = false;
        }

        if (!lastGradeStudied) {
            showError("lastGradeStudied", "Grado estudiado no válido");
            isValid = false;
        }

        if (!phoneNumber) {
            showError("phoneNumber", "Número de teléfono no válido");
            isValid = false;
        }

        return isValid;
    }

    function showError(fieldName, message) {
        const field = document.querySelector(`[name="${fieldName}"]`);
        const errorElement = field.parentNode.querySelector(".error-message");
        if (errorElement) {
            errorElement.textContent = message;
        } else {
            const errorDiv = document.createElement("div");
            errorDiv.classList.add("error-message");
            errorDiv.textContent = message;
            field.parentNode.appendChild(errorDiv);
        }
    }
});
