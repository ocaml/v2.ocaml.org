// Minimal javascript to make the collapsed menu work.
// `jquery` poses problems on some browsers.

function toggleVisibilityMenu(id) {
    var e = document.getElementById(id);
    if (e.style.display == "block") {
    e.style.right = "1000px";
    e.style.display = "none";
    }
    else {
	e.style.display = "block";
    e.style.right = "0";
    }
}