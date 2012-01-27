

// $(document).ready(function(){

//         $(".slidingDiv").hide();
//         $(".show_hide").show();

//     $('.show_hide').click(function(){
//     $(".slidingDiv").slideToggle();
//     });

// });

// this tells jquery to run the function below once the DOM is ready
$(document).ready(function() {
 
// choose text for the show/hide link - can contain HTML (e.g. an image)
var showText='Show';
var hideText='Hide';
 
// initialise the visibility check
var is_visible = false;
 
// append show/hide links to the element directly preceding the element with a class of "toggle"
$('#toggle').prev().append(' (<a href="#" class="toggleLink">'+showText+'</a>)');
 
// hide all of the elements with a class of 'toggle'
$('#toggle').hide();
 
// capture clicks on the toggle links
$('a.toggleLink').click(function() {
 
// switch visibility
is_visible = !is_visible;
 
// change the link depending on whether the element is shown or hidden
$(this).html( (!is_visible) ? showText : hideText);
 
// toggle the display - uncomment the next line for a basic "accordion" style
//$('.toggle').hide();$('a.toggleLink').html(showText);
$(this).parent().next('#toggle').toggle('slow');
 
// return false so any link destination is not followed
return false;
 
});
});


