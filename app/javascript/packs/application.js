import "bootstrap";
import "../components/calendar"
import mapboxgl from 'mapbox-gl';


// code for tags
const tags = document.querySelectorAll(".tag");

tags.forEach((tag) => {
  tag.addEventListener("click", (event) =>{
    if (event.currentTarget.classList.contains("active")) {
      tag.classList.remove("active");
      showTagResults();
    } else {
      tag.classList.add("active");
      showTagResults();
    };
  });
});


const showTagResults = () => {
  const activeTags = Array.from(document.querySelectorAll(".tag.active")).map(x => x.dataset.tag);
  if (activeTags.length === 0) {
    const allActivities = document.querySelectorAll(".activity");
    allActivities.forEach((activity) => {activity.style.display = "block"});
  } else {
    const allActivities = document.querySelectorAll(".activity");
    allActivities.forEach((activity) => {activity.style.display = "none"});
    const selectedActivities = document.querySelectorAll(`.activity.${activeTags.join('.')}`);
    selectedActivities.forEach((activity) => {activity.style.display = "block"});
  };
}

// code for sort by price
const ascending = document.getElementById("ascending");
const descending = document.getElementById("descending");
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
  let toSort = document.querySelector('.activities-container').children;
  toSort = Array.prototype.slice.call(toSort, 0);
  toSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.price);
    let bord = +parseInt(b.dataset.price);
    return aord - bord;
  });
  let parent = document.querySelector('.activities-container');
  parent.innerHTML = "";
  for(let i = 0, l = toSort.length; i < l; i++) {
    parent.appendChild(toSort[i]);
  }
};

const sortByDescending = () => {
  let toSort = document.querySelector('.activities-container').children;
  toSort = Array.prototype.slice.call(toSort, 0);
  toSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.price);
    let bord = +parseInt(b.dataset.price);
    return bord - aord;
  });
  let parent = document.querySelector('.activities-container');
  parent.innerHTML = "";
  for(let i = 0, l = toSort.length; i < l; i++) {
    parent.appendChild(toSort[i]);
  }
};




