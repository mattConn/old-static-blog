// getting an event's target
function getElementByEvent(event){
  console.log(event.target);
}

// get the target
var element = document.getElementsByClassName('element')[0];

//adding event listener to target
element.addEventListener('click', function(event){
  getElementByEvent(event);
});