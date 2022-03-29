// This script changes links depending on the selected ocaml version

// This variable should be manually modified when a new version appears.
// TODO: do this automatically.

var LAST_VERSION="4.14"
var ALL_VERSIONS = [ "latest", "4.14", "4.13", "4.12", "4.11", "4.10", "4.09", "4.08", "4.07", "4.06",
		     "4.05", "4.04", "4.03", "4.02", "4.01" ];


var CURRENT_VERSION_INDEX = localStorage.getItem("CURRENT_VERSION_INDEX");
if ( CURRENT_VERSION_INDEX == null ) {
    CURRENT_VERSION_INDEX = 0;
    localStorage.setItem("CURRENT_VERSION_INDEX", CURRENT_VERSION_INDEX);
}

// Which HTML "id" is used for the tools section.  This could be
// autodetected; it will be easier to do it when we merge the manual
// post-processing from https://github.com/sanette/ocaml-tutorial. In
// fact, it will probably be unnecessary, since we can directly link
// to the first file of Part III.
var tools_sec = {
    "latest": 289,
    "latest": 289,
    "4.13" : 289,
    "4.12" : 286,
    "4.11" : 286,
    "4.10" : 286,
    "4.09" : 285,
    "4.08" : 285,
    "4.07" : 280,
    "4.06" : 278,
    "4.05" : 263,
    "4.04" : 263,
    "4.03" : 261,
    "4.02" : 248,
    "4.01" : 240 };

function changeLink(version, latest_dir, dir, right, id) {
    let link = document.getElementById(id);
// We patch the existing links to preserve the local version of the manual
    let initialHref = link.dataset.initialHref;
    if (initialHref==undefined) {
        initialHref=link.getAttribute("href");
        link.dataset.initialHref=initialHref
    };
    let fragments = initialHref.split('/');
    let offset = (latest_dir.match(/\//g)||[]).length;
    let prefix = fragments.slice(0,fragments.length-1-offset).join('/');
    if (version=="latest") {
        ref = prefix+'/'+latest_dir+ right;
    }
    else {
        ref = prefix + '/releases/' + version + '/' + dir + right;
    };
    link.setAttribute("href", ref);
}

function libref(version) {
    if (version >= "4.12") {
        return("api/");
    }
    else {
        return ("htmlman/libref/");
    }

}

function setVersion(version) {
    var list = document.getElementsByClassName("form-control");
    for (let item of list) {
	item.value = version;
    }

    changeLink(version, 'manual/', 'htmlman/', 'extn.html', "extref");
    changeLink(version, 'manual/', 'htmlman/', 'extn.html', "extref_b");
    changeLink(version, 'manual/', 'htmlman/', 'index.html', "manual");
    changeLink(version, 'manual/', 'htmlman/', 'core.html', "corref");
    changeLink(version, 'manual/', 'htmlman/', 'index.html#sec' + tools_sec[version],
	       "toolref");
    changeLink(version, 'manual/', 'htmlman/', 'index.html#sec' + tools_sec[version],
	       "toolref_b");
    changeLink(version, 'manual/', 'htmlman/', 'index.html#sec6', "tutref");
    changeLink(version, 'manual/', 'htmlman/', 'index.html#sec6', "tutref_b");
    changeLink(version, 'manual/', 'htmlman/', 'stdlib.html', "stdlib");
    changeLink(version, 'api/', libref(version), 'index.html', "api_b");
    let expanded_version = version;
    if (version == "latest") { expanded_version=LAST_VERSION };
    let latest_release = 'releases/' + LAST_VERSION + '/';
    changeLink(version, latest_release, '', 'ocaml-' + expanded_version + '-refman.pdf', "refman-pdf");
    changeLink(version, latest_release, '', 'ocaml-' + expanded_version + '-refman.txt', "refman-txt");
    changeLink(version, latest_release, '',  'ocaml-' + expanded_version + '-refman-html.tar.gz', "refman-html");
    changeLink(version ,latest_release, '' , 'ocaml-' + expanded_version + '-refman.info.tar.gz', "refman-info");

    let stdlib = "Stdlib";
    if (parseFloat(version) < 4.08) { stdlib = "Pervasives"; }
    document.getElementById("stdlib_name").textContent=stdlib;
}

// TODO: it would be better to do this (fill the html for the version
// selector in index.md and index.fr.md) by a preprocessing, so that
// we don't have to bother with saving the CURRENT_VERSION variable...
function fill_selector(){
    let html = "";
    for (const version of ALL_VERSIONS) {
	html = html + '<option>' + version + '</option>';
    }
    document.getElementById("version-selector").innerHTML = html;
}


function refresh(){
    let i = document.Versions.selector.selectedIndex;
    CURRENT_VERSION_INDEX = i;
    localStorage.setItem("CURRENT_VERSION_INDEX", i);
    let version = document.Versions.selector.options[i].value;
    setVersion(version);
}

function init(){
    fill_selector();
    document.Versions.selector.selectedIndex = CURRENT_VERSION_INDEX;
}

init();
window.onload = refresh;

