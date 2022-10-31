//@ts-check

/** @param {HTMLDivElement} myBar */
const progress = (myBar) => {
  const id = setInterval(frame, 10);
  function frame() {
    const widthStr = myBar.style.width || "0%"
    const width = parseFloat(widthStr.slice(0, -1), 10)
    if (width >= 100) {
      clearInterval(id);
    } else {
      myBar.style.width = width + 0.05 + "%";
    }
  }
}

/**
 * @param {HTMLDivElement} progressBarContainer
 * @returns {HTMLDivElement}
 */
const setupProgressBar = (progressBarContainer) => {
  const progressBar = document.createElement("div")
  progressBar.setAttribute("id", "progress-bar")
  const myBar = document.createElement("div")
  myBar.setAttribute("id", "my-bar")
  progressBar.appendChild(myBar)
  progressBarContainer.innerText = ""
  progressBarContainer.appendChild(progressBar)
  return myBar
}

const main = () => {
  /** @type {HTMLDivElement | null} */
  const progressBarContainer = document.querySelector("#progress-bar-container");

  /** @type {HTMLInputElement | null} */
  const startJobButton = document.querySelector("button[id=start-job]");

  if(!!startJobButton && !!progressBarContainer) {
    startJobButton.disabled = false;
    startJobButton.onclick = () => {
      startJobButton.disabled = true;
      const myBar = setupProgressBar(progressBarContainer)
      progress(myBar)
    };
  }
};

main();

