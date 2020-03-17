import "bootstrap";

const tags = document.querySelectorAll(".tag");

tags.forEach((tag) => {
  tag.addEventListener("click", (event) =>{
    if (event.currentTarget.classList.contains("active")) {
      tag.classList.remove("active");
      const selectedActivities = document.querySelectorAll(`.activity.${event.currentTarget.dataset.tag}`);
      const allActivities = document.querySelectorAll(".activity");
      selectedActivities.forEach((activity) => {activity.style.display = "none"});
      allActivities.forEach((activity) => {activity.style.display = "block"});
    } else {
      tag.classList.add("active");
      const selectedActivities = document.querySelectorAll(`.activity.${event.currentTarget.dataset.tag}`);
      const allActivities = document.querySelectorAll(".activity");
      allActivities.forEach((activity) => {activity.style.display = "none"});
      selectedActivities.forEach((activity) => {activity.style.display = "block"});
    };
  });
});

    // console.log("Art and culture".toLowerCase().replace(/ /g, "-"))
