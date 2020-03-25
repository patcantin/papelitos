const start = document.querySelector(".show_game");


start.addEventListener("click", (event) => {
  const playerInfo = document.querySelector(".playing");
  playerInfo.classList.remove("hide_playing");
});
