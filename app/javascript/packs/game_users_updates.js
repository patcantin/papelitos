import { csrfToken } from "@rails/ujs";

const teamOnePlayers = document.querySelector("#team-1-players");
const teamTwoPlayers = document.querySelector("#team-2-players");
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
      teamOnePlayers.innerHTML = data.team_1_players;
      teamTwoPlayers.innerHTML = data.team_2_players;
    });
}, 1000);









