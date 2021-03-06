const futures = document.querySelectorAll('.future.current-month');
const errorDiv = document.querySelector('.errors');
const table = document.querySelector('table');
const bookingDate = document.getElementById('booking_date');
const button = document.querySelector('.date-submit');
const taken = document.querySelectorAll('.taken-dates');
const groupSize = document.getElementById('booking_group_size');
const bookedDates = document.querySelectorAll('.booked-dates');

const availableDates = Array.from(document.querySelectorAll(".avail-dates"))


button.disabled = true;

futures.forEach((future) => {
  future.classList.remove('future')
  future.classList.add('past')
  availableDates.forEach((date) => {
    if (date.innerText === future.innerText) {
      future.classList.remove('past')
      future.classList.add('future')
    }
  })

  bookedDates.forEach((date) => {
    if (date.innerText === future.innerText) {
      future.classList.add('past')
      future.classList.remove('future')
    }
  })

  future.addEventListener("click", (e) => {
    if (e.currentTarget.classList.contains('future')) {

      const activeDate = document.querySelector('.date-active');
      if (activeDate) {
        activeDate.classList.remove('date-active')
      }
      e.currentTarget.classList.add('date-active')
      bookingDate.value = e.target.innerText;
      button.disabled = false;
    }
  })
})

// let dateSelected = false;
// let error;
// button.disabled = true;

// let takenDates = []

// taken.forEach((took) => {
//   takenDates.push(took.innerText)
// })



// futures.forEach((future) => {
//     if (takenDates.includes(future.innerText)) {
//       future.classList.add('date-busy');
//       future.classList.remove('future');
//     }
//     future.addEventListener('click', (e) => {
//       errorDiv.innerText = '';
//       if (!dateSelected && e.target.className.match('date-active') === null && e.target.className.match('future') !== null) {
//         e.target.classList.add('date-active')
//         dateSelected = true;
//         bookingDate.value = e.target.innerText
//         button.disabled = false;
//       }
//       else if (dateSelected && e.target.className.match('date-active') !== null && e.target.className.match('future') !== null) {
//         e.target.classList.remove('date-active')
//         dateSelected = false;
//         bookingDate.value = '';
//         button.disabled = true;
//       } else if (e.target.className.match('future') !== null) {
//         error = "Please select only one date!"
//         errorDiv.innerText = error;
//         button.disabled = true;
//       }
//     })
// })
