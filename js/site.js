/* M2C2 — network page tab switching.
   Participant listings are static HTML baked in by build.py (see data/participants.csv). */

(function () {
  "use strict";

  var tabs = document.querySelectorAll(".tab");
  var panels = document.querySelectorAll(".tab-panel");

  function activate(name) {
    tabs.forEach(function (t) {
      t.classList.toggle("active", t.dataset.tab === name);
    });
    panels.forEach(function (p) {
      p.classList.toggle("active", p.id === "panel-" + name);
    });
  }

  tabs.forEach(function (t) {
    t.addEventListener("click", function () {
      activate(t.dataset.tab);
      history.replaceState(null, "", "#" + t.dataset.tab);
    });
  });

  var hash = location.hash.replace("#", "");
  if (hash && document.getElementById("panel-" + hash)) activate(hash);
})();
