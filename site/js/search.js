// Searching the OCAML API.
// San VU NGOC, 2019

// Thanks @steinuil for help on deferred loading.

const MAX_RESULTS = 20;
const MAX_ERROR = 10;

let indexState = 'NOT_LOADED';

// return true if we are loading the index file
function loadingIndex (includeDescr) {

    switch (indexState) {
    case 'NOT_LOADED':
	indexState = 'LOADING';
	
	const script = document.createElement('script');
	script.src = 'index.js';
	script.addEventListener('load', () => {
	    indexState = 'HAS_LOADED';
	    mySearch(includeDescr);
	});
	document.head.appendChild(script);
	return true;
	
    case 'LOADING':
	return true;
	
    case 'HAS_LOADED':
	return false;
    }
}

function isSubString (sub, s) {
    // s = s.toLowerCase();
    // sub = sub.toLowerCase();
    // case sensitive is better for OCaml modules.
    return (s.indexOf(sub) !== -1);
}

// line is a string array. We check if sub is a substring of one of
// the elements of the array.
function hasSubString (sub, line) {
    return (line.findIndex(function (s) {
	return (isSubString(sub,s)); }) !== -1);
}

// Check if one of the strings in subs is a substring of one of the
// strings in line.
function hasSubStrings (subs, line) {
    return (subs.findIndex(function (sub) {
	return (hasSubString (sub, line)); }) !== -1);
}

// error of sub being a substring of s. Best if starts at 0. 
function subError (sub, s) {
    let err = s.indexOf(sub);
    if (err == -1) { err = MAX_ERROR; }
    else { err = Math.min(err,1) // 0 or 1
	   + Math.abs((s.length - sub.length) / s.length);}
    return (err)
    // between 0 and 2, except if MAX_ERROR
}

function subMinError (sub, line) {
    let strings = [line[0], line[1], line[2]];
    let errs = strings.map(function (s) { return subError (sub, s); });
    return Math.min(errs[0],errs[1],errs[2]);
}
    // do the general case?

function add (acc, a) {
    return acc + a;
}

function subsError (subs, s) {
    let errs = subs.map(function (sub) { return subError (sub, s); });
    return errs.reduce(add,0) / subs.length;
}
    
// This should print "true" to the console
//let line = ["abc", "123", "hello"];
//console.log (hasSubString ("ell", line));

//console.log(GENERAL_INDEX.filter(function (line) {
//    return (hasSubString("iter", line)); })[0]);

function formatLine (line) {
    let html = '<code class="code"><a href="' + line[1] + '"><span class="constructor">' + line[0] + '</span></a>' +
	'.' + '<a href="' + line[3] + '">' + line[2] + '</a></code>';
    if (line.length > 5) { html += line[4]; }
    return (html);
}

// The initial format of an entry of the GENERAL_INDEX array is
// [ module, module_link,
//   value, value_link,
//   html_description, bare_description ]

// If includeDescr is true, the line is truncated to its first 4
// elements.  When searching, the search error is added at the end of
// each line.

// In order to reduce the size of the index.js file, one could create
// the bare_description on-the-fly using .textContent, see
// https://stackoverflow.com/questions/28899298/extract-the-text-out-of-html-string-using-javascript,
// but it would probably make searching slower (haven't tested).
function mySearch (includeDescr) {
    if (loadingIndex (includeDescr)) {
	return;
    }
    let text = document.getElementById('api_search').value;
    let results = [];
    let html = "";
    let count = 0;
    let err_index = 4;
    if (text !== "") {
	let words = [];
	if ( includeDescr ) {
	    err_index = 6;
	    // Split text into an array of non-empty words:
	    words = text.split(" ").filter(function (s) {
		return (s !== "");})}
	results = GENERAL_INDEX.filter(function (line) {
	    // We remove the html hrefs and add the Module.value complete name:
	    let cleanLine = [line[0], line[2], line[0] + '.' + line[2]];
	    line.length = err_index;
	    // this removes the description part if includeDescr =
	    // false (which modifies the lines of the GENERAL_INDEX.)
	    if ( includeDescr ) {
		cleanLine.push(line[5]); } // add the description
	    if ( hasSubString(text, cleanLine) ||
		 // if includeDescr, we search for all separated words
		 ( includeDescr && hasSubStrings(words, cleanLine))) {
		// one could merge hasSubString and subMinError for efficiency
		let error = subMinError(text, cleanLine);
		if ( includeDescr ) {
		    error = Math.min(error, subsError(words, line[5])); }
		line.push(error); // we add the error as element #err_index
		return (true); } else {
		    return (false); }});
	// We sort the results by relevance:
	results.sort(function(line1, line2) {
	    return (line1[err_index] - line2[err_index])});
	count = results.length;
	console.log("Results = " + (count.toString()));
	results.length = Math.min(results.length, MAX_RESULTS);
	html = "no results";
	//console.log (results[0]);
    }
    // injects new html
    if (results.length > 0) {
	html = "<ul>";
	function myIter(line, index, array) {
	    html = html + "<li>" + formatLine(line) + "</li>\n";
	}
	results.forEach(myIter);
	html += "</ul>";
	if (count > results.length) {
	    html += "(...)";
	}
    }
    document.getElementById("search_results").innerHTML = html;
    //document.addEventListener( 'click', function ( e ) { console.log ("click-clack"); console.log(e); });
}

