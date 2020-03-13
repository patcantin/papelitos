
  const create = document.querySelector(".create");
  const join = document.querySelector(".join");

  create.addEventListener('click', (event) => {
    const showKey = document.querySelector(".key");
    showKey.insertAdjacentHTML('beforeend', 8465);
  });

  join.addEventListener('click', (event) => {
    const showInput = document.querySelector(".enter_key");
    showInput.classList.remove('rem');
  });
