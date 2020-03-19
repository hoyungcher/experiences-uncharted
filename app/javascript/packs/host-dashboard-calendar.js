const bookedDate = document.querySelectorAll('.host-booked-date')
const bookings = document.querySelectorAll('.bookings')
const availability = document.querySelectorAll('.availability')
      console.log(bookings)
const futures = document.querySelectorAll('.future')
futures.forEach(future => {
  future.classList.remove('future');
  future.classList.add('past');
  future.classList.add('unclickable');
  bookings.forEach((booking) => {
    if (future.innerText === booking.firstElementChild.innerText) {
      future.classList.remove('past');
      future.classList.remove('unclickable');
      future.classList.add("upcoming-booking");
      future.insertAdjacentHTML('beforeend', `<i class="fas fa-dot-circle"></i>`);
      future.insertAdjacentHTML('beforeend', ` <div class ="hidden calendar-details">
        <p class="calendar-text">${booking.childNodes[3].innerText}</p>
        <p class="calendar-text">${booking.childNodes[5].innerText}</p>
        <p class="calendar-text">${booking.childNodes[7].innerText} pax</p>
      </div>
        `)
    }

  })

  availability.forEach((date) => {
    if (future.innerText === date.innerText) {
      future.classList.remove('past');
      future.classList.add('future');
    }
  })
})

const upcoming = document.querySelectorAll('.upcoming-booking')
upcoming.forEach(booking => {
  booking.addEventListener('click', (e) => {
    e.target.lastElementChild.classList.toggle('hidden')
  })
})
