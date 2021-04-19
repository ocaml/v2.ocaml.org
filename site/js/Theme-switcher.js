/*Js file to control theme-switch toggle button*/
let style = localStorage.getItem('style'); //storing current theme

//default
if (style == null) {
  setTheme('light');
} else {
  setTheme(style);
}

//function to load toggle button current state
function load(){    
  var checked = JSON.parse(localStorage.getItem('switch'));
  if (checked == true) {
      document.getElementById("switch").checked=true;
  }
}
//function to control toggle button and find theme
document.getElementById("theme-toggle").addEventListener('click', function () {

let  yes = document.getElementById("switch"); 
let theme; 
let box;
  if (yes.checked == true){  theme = 'light';
  box=false;}
  else
   { theme='dark';
 box=true;}
localStorage.setItem("switch", JSON.stringify(box));
  setTheme(theme);

});

//function to set theme
function setTheme(theme) {
  if (theme == 'light') {
   
    //document.querySelector("#switcher-id1").setAttribute('disabled', 'disabled');
    document.querySelector("#switcher-id1").setAttribute('disabled','disabled');
    document.querySelector("#switcher-id2").removeAttribute('disabled');
    
    
  } else if (theme == 'dark') {
    //document.querySelector("#switcher-id2").setAttribute('disabled','disabled');
    document.querySelector("#switcher-id2").setAttribute('disabled','disabled');
    document.querySelector("#switcher-id1").removeAttribute('disabled');
    
  
  }
  localStorage.setItem('style', theme);
}



//call load function

load();
