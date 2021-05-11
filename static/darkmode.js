document.addEventListener("DOMContentLoaded", () => {

    const app = document.querySelector(".container");
    const toggle = document.querySelector("#darkmode-toggle");
    const userPref = window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark';
    let currentTheme = localStorage.getItem('theme') ?? userPref;
    const themeName = document.querySelector(".theme-text");
    themeName.innerText = currentTheme == "light" ? "☀️" : "🌑";

    if (currentTheme) {
        app.classList.remove(currentTheme);
        app.classList.add(currentTheme);
    }

    const switchTheme = () => {
        app.classList.remove(currentTheme);
        currentTheme = currentTheme === "light" ? "dark" : "light";
        app.classList.add(currentTheme);
        themeName.innerText = currentTheme == "light" ? "☀️" : "🌑";
        localStorage.setItem('theme', currentTheme);
    }
    toggle.addEventListener("change", switchTheme);
});