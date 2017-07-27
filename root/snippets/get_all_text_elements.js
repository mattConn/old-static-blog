// simple tag getting fn
var getTag = function(tag){
		return document.getElementsByTagName(tag);
}

// wanted: elements we want to get by tag.
// caught: tags caught; where we will put the wanted elements, if they exist.
// missing: if tag not present in document, list here.
var textCatcher = {
		wanted : ['p','ul','ol','li','a','span','strong','i','b','h1','h2','h3','h4','h5','h6'],
		caught : [],
		missing: []
}

// Search document for  all wanted tags.
// If the wanted tag exists in document,
// push all elements of that tag into 'caught' array.
// Else, push tag name (listed in 'wanted' array) into missing array.
for( var i=0; i < textCatcher.wanted.length; i++ ){
	if( getTag( textCatcher.wanted[i]).length > 0 ){
		textCatcher.caught.push( getTag( textCatcher.wanted[i] ) );
	} else {
		textCatcher.missing.push( textCatcher.wanted[i] );
	}
} 

// log to console for inspection
console.log(textCatcher);