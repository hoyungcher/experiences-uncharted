const futures = document.querySelectorAll('.future.current-month');
const table = document.querySelector('table');
const button = document.querySelector('.date-submit');
const taken = document.querySelectorAll('.taken-dates');
const groupSize = document.getElementById('booking_group_size')

const bookedDates = Array.from(document.querySelectorAll('.booked-date'))
console.log(bookedDates)



const availableDates = Array.from(document.querySelectorAll('.available-date'))

const input = document.querySelector('.dates-post')

let error;

let takenDates = [];

taken.forEach((took) => {
  takenDates.push(took.innerText)
});

let formDates = [];

futures.forEach((future) => {
  let selectedDates = Array.from(document.querySelectorAll('.date-active'));
  formDates = selectedDates.map(date => date.innerText)
  input.value = formDates.join(",")

  availableDates.forEach((date) => {
    if (date.innerText === future.innerText) {
      future.classList.add("date-active")
    }
  })

  bookedDates.forEach((date) => {
    if (date.innerText === future.innerText) {
      future.classList.remove("date-active")
      future.classList.add("booked-date")
    }
  })

 future.addEventListener('click', (e) => {
  if (!e.target.classList.contains("booked-date")) {
  e.target.classList.toggle("date-active");
  let selectedDates = Array.from(document.querySelectorAll('.date-active'));
  formDates = selectedDates.map(date => date.innerText)
  input.value = formDates.join(",")
 }})
})




