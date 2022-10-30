//@ts-check
const main = async () => {
  const loadingBar = document.getElementById("loading-bar");
  const startLoadingButton = document.getElementById("start-loading");

  startLoadingButton.disabled = false;

  startLoadingButton.onclick = () => {
    startLoadingButton.disabled = true;
    loadingBar.innerText = `loading ...`;
  };
};

main();

