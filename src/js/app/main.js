// prevent default event for navigation links
var navLinks = document.getElementById('navigation').childNodes;

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].onclick = function(e) {
		e.preventDefault();
	};
};

// on hover '.item' in 'section#portfolio'
// change image class to 'hovered' it will scale it up a bit with css transitions
// and give class '.show' to '.overlay' to show text and button "Take a Look"
var sectionPortfolio = document.getElementById('portfolio');
var items = sectionPortfolio.getElementsByClassName('item');

for (var i = items.length - 1; i >= 0; i--) {

	items[i].addEventListener('mouseenter', function() {
		// add class 'hovered'
		var item = this;
		var hoveredImage = item.getElementsByTagName('img')[0];
		var overlay = item.getElementsByClassName('overlay')[0];

		hoveredImage.classList.add('hovered');
		overlay.classList.add('show');
	});

	items[i].addEventListener('mouseleave', function() {
		// remove class 'hovered'
		var item = this;
		var hoveredImage = item.getElementsByTagName('img')[0];
		var overlay = item.getElementsByClassName('overlay')[0];

		hoveredImage.classList.remove('hovered');
		overlay.classList.remove('show');
	});

	var buttons = items[i].getElementsByTagName('button');
	for (var b = buttons.length - 1; b >= 0; b--) {
		buttons[b].addEventListener('click', function(e) {
			var dataOutlet = this.dataset.outlet;
			var modal = document.getElementById(dataOutlet);

			if (modal === null) {
				console.error('No match modal here!' + ' => ' + modal);
			} else {
				modal.classList.add('show-modal');
			}

			document.body.classList.add('no-scroll');

			var closeBtn = modal.getElementsByClassName('modal-close')[0];
			
			closeBtn.addEventListener('click', function() {
				modal.classList.remove('show-modal');
				document.body.classList.remove('no-scroll');
			});

			modal.addEventListener('click', function(e) {
				if (e.target === this) {
					modal.classList.remove('show-modal');
					document.body.classList.remove('no-scroll');
				}
			});
		});
	};

};