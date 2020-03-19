const bookedDate = document.querySelectorAll('.host-booked-date')
const bookings = document.querySelectorAll('.bookings')
const availability = document.querySelectorAll('.availability')
console.log(availability)

const futures = document.querySelectorAll('.future')
futures.forEach(future => {
  future.classList.remove('future')
  future.classList.add('past')
  bookings.forEach((booking) => {
    if (future.innerText === booking.firstElementChild.innerText) {
      future.classList.remove('past');
      future.classList.add("upcoming-booking")
      future.insertAdjacentHTML('beforeend', `${booking.childNodes[5].innerText}`)
    }

  })

  availability.forEach((date) => {
    if (future.innerText === date.innerText) {
      future.classList.remove('past');
      future.classList.add('future');
    }
  })
})
