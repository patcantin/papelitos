import { csrfToken } from '@rails/ujs';
const increaseScrore = document.getElementById('increase-score');
const currentWord = document.querySelector('#current-word');
const yourTeamIsPlaying = document.querySelector('#your-team-is-playing');
const youArePlaying = document.querySelector('#you-are-playing');
const whoIsPlaying = document.querySelector('#who-is-playing');
const secondsLeft = document.querySelector('#seconds-left');
const teamOnePoints = document.querySelector('#team-1-points');
const teamTwoPoints = document.querySelector('#team-2-points');
const roundName = document.querySelector('#round-name');
const gameState = document.getElementById('game-state');
const gameId = gameState.dataset.gameId;
const gameTeamId = gameState.dataset.gameTeam;
const gameWords = JSON.parse(gameState.dataset.gameWords);
console.log(Array.isArray(gameWords));
if (currentWord) currentWord.innerHTML = gameWords.pop();
setInterval(() => {
  fetch(`/games/${gameId}`, {
    method : 'get',
    headers: {
      'X-CSRF-Token': csrfToken(),
      credentials   : 'same-origin',
      Accept        : 'application/json'
    }
  })
    .then(response => response.json())
    .then((data) => {
      if (yourTeamIsPlaying) yourTeamIsPlaying.innerHTML = data.your_team_is_playing;
      if (youArePlaying) youArePlaying.innerHTML = data.you_are_playing;
      if (secondsLeft) secondsLeft.innerHTML = data.seconds_left;
      if (teamOnePoints) teamOnePoints.innerHTML = data.team_1_points;
      if (teamTwoPoints) teamTwoPoints.innerHTML = data.team_2_points;
      if (roundName) roundName.innerHTML = data.round_name;
      if (whoIsPlaying) whoIsPlaying.innerHTML = data.who_is_playing;
    });
}, 1000);
if (increaseScrore) {
  increaseScrore.addEventListener('click', () => {
    if (gameWords.length > 0) {
      currentWord.innerHTML = gameWords.pop();
    } else {
      currentWord.innerHTML = 'Finish!';
    }
    fetch(`/game_teams/${gameTeamId}`, {
      method : 'PATCH',
      headers: {
        'X-CSRF_TOKEN': csrfToken(),
        credentials   : 'same-origin',
        Accept        : 'application/json'
      },
      body: JSON.stringify({})
    });
  });
}
