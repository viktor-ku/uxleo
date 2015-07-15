// get style function
function getStyle(el, styleProp) {
  var value, defaultView = el.ownerDocument.defaultView;
  // W3C standard way:
  if (defaultView && defaultView.getComputedStyle) {
    // sanitize property name to css notation (hypen separated words eg. font-Size)
    styleProp = styleProp.replace(/([A-Z])/g, "-$1").toLowerCase();
    return defaultView.getComputedStyle(el, null).getPropertyValue(styleProp);
  } else if (el.currentStyle) { // IE
    // sanitize property name to camelCase
    styleProp = styleProp.replace(/\-(\w)/g, function(str, letter) {
      return letter.toUpperCase();
    });
    value = el.currentStyle[styleProp];
    // convert other units to pixels on IE
    if (/^\d+(em|pt|%|ex)?$/i.test(value)) { 
      return (function(value) {
        var oldLeft = el.style.left, oldRsLeft = el.runtimeStyle.left;
        el.runtimeStyle.left = el.currentStyle.left;
        el.style.left = value || 0;
        value = el.style.pixelLeft + "px";
        el.style.left = oldLeft;
        el.runtimeStyle.left = oldRsLeft;
        return value;
      })(value);
    }
    return value;
  }
}

// prevent default event for navigation links
var navLinks = document.getElementById('navigation').childNodes;

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].onclick = function(e) {
		e.preventDefault();
	};
};

// change 'top' css atribute in '#welcome-inner' from 50% to above 100% with scrolling
// trying to make parallax effect
document.addEventListener('scroll', function() {
	var scrolled = window.pageYOffset || document.documentElement.scrollTop;
	var welcomeInner = document.getElementById('welcome-inner');

	console.log(getStyle(welcomeInner, 'top'));
});