const futures = document.querySelectorAll('.future.current-month');
const errorDiv = document.querySelector('.errors');
const table = document.querySelector('table');
const bookingDate = document.getElementById('booking_date');
const button = document.querySelector('.date-submit');
const taken = document.querySelectorAll('.taken-dates');

let dateSelected = false;
let error;
button.disabled = true;

let takenDates = []

taken.forEach((took) => {
  takenDates.push(took.innerText)
})



futures.forEach((future) => {
    if (takenDates.includes(future.innerText)) {
      future.classList.add('date-busy');
      future.classList.remove('future');
    }
    future.addEventListener('click', (e) => {
      errorDiv.innerText = '';
      if (!dateSelected && e.target.className.match('date-active') === null && e.target.className.match('future') !== null) {
        e.target.classList.add('date-active')
        dateSelected = true;
        bookingDate.value = e.target.innerText
        button.disabled = false;
      }
      else if (dateSelected && e.target.className.match('date-active') !== null && e.target.className.match('future') !== null) {
        e.target.classList.remove('date-active')
        dateSelected = false;
        bookingDate.value = '';
        button.disabled = true;
      } else if (e.target.className.match('future') !== null) {
        error = "Please select only one date!"
        errorDiv.innerText = error;
        button.disabled = true;
      }
    })
})

