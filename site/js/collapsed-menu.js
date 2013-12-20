// Minimal javascript to make the collapsed menu work.
// `jquery` poses problems on some browsers.

function toggleVisibilityMenu(id) {
    var e = document.getElementById(id);
    if (e.style.height == "auto") {
	e.style.height = "0px";
    }
    else {
	e.style.height = "auto";
    }
}
