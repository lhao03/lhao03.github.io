var spotifyUrl = "https://www.last.fm/user/lhao03/library/artists?date_preset=LAST_7_DAYS";
var anotherSpotifyUrl = "https://www.last.fm/user/lhao03/library/artists?date_preset=LAST_30_DAYS"

async function fetchAsync(url) {
  let response = await fetch(url);
  let data = response.text();
  return data;
}

var result = fetchAsync(anotherSpotifyUrl);
console.log(result.then(res => {
  res = res.replace(/[\r\n\x0B\x0C\u0085\u2028\u2029]+/g, " ");
  res = res.replace(/(\r\n|\n|\r)/gm, "");
  console.log(res);
  const regex = /<meta\s*property="og:title"\s*content="lhao03&#39;s\s*top\s*artists"\s*\/>\s*<meta\s*property="og:description"\s*content="(.*)"\s*\/>\s*<meta\s*name="twitter:title"\s*content="lhao03&#39;s\s*top\s*artists"\s*\/>/gm;
  let m;

  while ((m = regex.exec(res)) !== null) {
    // This is necessary to avoid infinite loops with zero-width matches
    if (m.index === regex.lastIndex) {
      regex.lastIndex++;
    }

    // The result can be accessed through the `m`-variable.
    m.forEach((match, groupIndex) => {
      console.log(`Found match, group ${groupIndex}: ${match}`);
      match = match.replace(/,/g, '\n');
      document.getElementById("current-artists").innerText = match;
    });
  }
}))

document.addEventListener("DOMContentLoaded", () => {

  const app = document.querySelector(".container");
  const toggle = document.querySelector("#darkmode-toggle");
  const userPref = window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'dark';
  let currentTheme = localStorage.getItem('theme') ?? userPref;
  const themeName = document.querySelector(".theme-text");
  themeName.innerText = currentTheme == "light" ? "🌑" : "☀️";

  if (currentTheme) {
    app.classList.remove(currentTheme);
    app.classList.add(currentTheme);
  }

  const switchTheme = () => {
    app.classList.remove(currentTheme);
    currentTheme = currentTheme === "light" ? "dark" : "light";
    app.classList.add(currentTheme);
    themeName.innerText = currentTheme == "light" ? "🌑" : "☀️";
    localStorage.setItem('theme', currentTheme);
  }
  toggle.addEventListener("change", switchTheme);
});

window.onload = function() {
  window.addEventListener('scroll', function(e) {
    if (window.pageYOffset > 100) {
      document.querySelector("header").classList.add('is-scrolling');
    } else {
      document.querySelector("header").classList.remove('is-scrolling');
    }
  });

  const menu_btn = document.querySelector('.hamburger');
  const mobile_menu = document.querySelector('.mobile-nav');

  menu_btn.addEventListener('click', function() {
    menu_btn.classList.toggle('is-active');
    mobile_menu.classList.toggle('is-active');
    document.documentElement.classList.toggle("is-active");
  });
}

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}

