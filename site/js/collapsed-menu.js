// Minimal javascript to make the collapsed menu work.
// `jquery` poses problems on some browsers.

function toggleVisibilityMenu(id) {
    var e = document.getElementById(id);
    if (e.style.height == "auto") {
	e.style.height = "0";
    e.style.right = "1000px";

    }
    else {
	e.style.height = "auto";
    e.style.right = "0";
    }
}