# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function about() {
  info = document.getElementById('about-content');
  if (window.XMLHttpRequest)
    { xhr = new XMLHttpRequest(); }
  else
    { xhr = new ActiveXObject("Microsoft.XMLHTTP"); }
  xhr.open("GET","rails/info/properties",false);
  xhr.send("");
  info.innerHTML = xhr.responseText;
  info.style.display = 'block'
}