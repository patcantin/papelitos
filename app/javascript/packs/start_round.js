const start = document.querySelector(".show_game");

if (start){
start.addEventListener("click", (event) => {
  const playerInfo = document.querySelector(".playing");
  playerInfo.classList.remove("hide_playing");
  start.classList.add("hide_playing");
});
}
