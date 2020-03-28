import { csrfToken } from "@rails/ujs";

const teamPlayers = document.querySelector("#team-players");

const gameId = document.querySelector("#game-id").dataset.gameId;
setInterval(() => {
  fetch(`/games/${gameId}`, {
    method: "get",
    headers: {
      "X-CSRF-Token": csrfToken(),
      "credentials": 'same-origin',
      "Accept": "application/json"
    }
  })
    .then(response => response.json())
    .then((data) => {
      // console.log(data);
      teamPlayers.innerHTML = data.team_players;
    });
}, 1000);









