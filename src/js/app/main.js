// prevent default event for navigation links
var navLinks = document.getElementById('navigation').childNodes;

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].onclick = function(e) {
		e.preventDefault();
	};
};