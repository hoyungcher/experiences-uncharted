import "bootstrap";

// code for tags
const tags = document.querySelectorAll(".tag");

tags.forEach((tag) => {
  tag.addEventListener("click", (event) =>{
    if (event.currentTarget.classList.contains("active")) {
      tag.classList.remove("active");
      showSelectedResults();
    } else {
      disableAllActiveTags();
      tag.classList.add("active");
      showSelectedResults();
    };
  });
});

const disableAllActiveTags = () => {
  tags.forEach((tag) => {
    tag.classList.remove("active");
  })
};

//code for cities

const cities = document.querySelectorAll(".city-card");

cities.forEach((city) => {
  city.addEventListener("click", (event) =>{
    if (event.currentTarget.classList.contains("active")) {
      city.classList.remove("active");
      showSelectedResults();
    } else {
      disableAllActiveCities();
      city.classList.add("active");
      showSelectedResults();
    };
  });
});

const disableAllActiveCities = () => {
  cities.forEach((city) => {
    city.classList.remove("active");
  })
};


const showSelectedResults = () => {
  const activeCity = document.querySelector(".city-card.active");
  const activeTags = Array.from(document.querySelectorAll(".tag.active")).map(x => x.dataset.tag);
  if (activeCity && activeTags.length > 0) {
    const selectedActivities = document.querySelectorAll(`.activity.${activeTags.join('.')}[data-city=${activeCity.id}]`);
    const allActivities = document.querySelectorAll('.activity');
    allActivities.forEach((activity) => {
      activity.style.display = "none"
    });
    selectedActivities.forEach((activity) => {
      activity.style.display = "block"
    });
  } else if (activeCity && activeTags.length === 0) {
    const selectedActivities = document.querySelectorAll(`.activity[data-city=${activeCity.id}]`);
    const allActivities = document.querySelectorAll('.activity');
    allActivities.forEach((activity) => {
      activity.style.display = "none"
    });
    selectedActivities.forEach((activity) => {
      activity.style.display = "block"
    });
  } else if (!activeCity && activeTags.length > 0) {
    const selectedActivities = document.querySelectorAll(`.activity.${activeTags.join('.')}`);
    const allActivities = document.querySelectorAll('.activity');
    allActivities.forEach((activity) => {
      activity.style.display = "none"
    });
    selectedActivities.forEach((activity) => {
      activity.style.display = "block"
    });
  } else {
    const allActivities = document.querySelectorAll('.activity');
    allActivities.forEach((activity) => {
      activity.style.display = "block"
    });
  }
};


// code for sort by price
const ascending = document.getElementById("price-ascending");
const descending = document.getElementById("price-descending");
ascending.addEventListener("click", (event) => {
  if (event.currentTarget.classList.contains("active")) {
    event.currentTarget.classList.remove("active");
  } else {
    event.currentTarget.classList.add("active");
    descending.classList.remove("active");
    sortByAscending();
  };
});

descending.addEventListener("click", (event) => {
  if (event.currentTarget.classList.contains("active")) {
    event.currentTarget.classList.remove("active");
  } else {
    event.currentTarget.classList.add("active");
    ascending.classList.remove("active");
    sortByDescending();
  };
});

const sortByAscending = () => {
  let toSort = document.querySelector('.activities-container .row').children;
  toSort = Array.prototype.slice.call(toSort, 0);
  toSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.price);
    let bord = +parseInt(b.dataset.price);
    return aord - bord;
  });
  let parent = document.querySelector('.activities-container .row');
  parent.innerHTML = "";
  for(let i = 0, l = toSort.length; i < l; i++) {
    parent.appendChild(toSort[i]);
  }
};

const sortByDescending = () => {
  let toSort = document.querySelector('.activities-container .row').children;
  toSort = Array.prototype.slice.call(toSort, 0);
  toSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.price);
    let bord = +parseInt(b.dataset.price);
    return bord - aord;
  });
  let parent = document.querySelector('.activities-container .row');
  parent.innerHTML = "";
  for(let i = 0, l = toSort.length; i < l; i++) {
    parent.appendChild(toSort[i]);
  }
};

const checkEmptyResults = () => {
  const displayedActivities = document.querySelectorAll(`.activity[style='display: block;']`)
  if (displayedActivities.length === 0) {
    alert("No results for selected filters. Please remove a filter.");
  };
};

