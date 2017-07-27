$(document).keyup(function(e) { //keydown can be used as well.
    switch(e.which) {
    
        case 37: //left; any keycode can be used for each case.
          alert('keycode: '+e.which);
        break;

        default: return; // exit this handler for other keys
    }
    e.preventDefault(); // prevent the default action (scroll / move caret)
});