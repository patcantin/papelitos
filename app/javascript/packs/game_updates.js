import { csrfToken } from "@rails/ujs";
const currentWord = document.querySelector("#current-word");
const yourTeamIsPlaying = document.querySelector("#your-team-is-playing");
const youArePlaying = document.querySelector("#you-are-playing");
const whoIsPlaying = document.querySelector("#who-is-playing");
const secondsLeft = document.querySelector("#seconds-left");
const teamOnePoints = document.querySelector("#team-1-points");
const teamTwoPoints = document.querySelector("#team-2-points");
const roundName = document.querySelector("#round-name");
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
      currentWord.innerHTML = data.current_word;
      yourTeamIsPlaying.innerHTML = data.your_team_is_playing;
      youArePlaying.innerHTML = data.you_are_playing;
      secondsLeft.innerHTML = data.seconds_left;
      teamOnePoints.innerHTML = data.team_1_points;
      teamTwoPoints.innerHTML = data.team_2_points;
      roundName.innerHTML = data.round_now;
      whoIsPlaying.innerHTML = data.who_is_playing;
    });
}, 1000);









