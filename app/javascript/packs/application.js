import "bootstrap";
import "../components/calendar"

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






