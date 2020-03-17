import "bootstrap";

const tags = document.querySelectorAll(".tag");

tags.forEach((tag) => {
  tag.addEventListener("click", (event) =>{
    tag.classList.toggle("active");
  });
});
