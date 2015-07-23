

// portfolio all stuff

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

			if (modal === null || modal === undefined) {
				console.error('No match modal here!' + ' => ' + modal);
			} else {
				modal.classList.add('show-modal');
			}

			var closeBtn = modal.getElementsByClassName('modal-close')[0];

			var closeModal = function() {
				modal.classList.remove('show-modal');
				document.body.classList.remove('no-scroll');
			};

			closeBtn.addEventListener('click', function() {
				closeModal();
			});

			modal.addEventListener('click', function(e) {
				if (e.target === this) {
					closeModal();
				}
			});
		});
	};

};

// smooth scroll stuff

var navLinks = document.getElementById('nav').children;
var toContactBtn = document.getElementById('to-contact');

var section = {
	about: document.getElementById('about').offsetTop,
	service: document.getElementById('service').offsetTop,
	value: document.getElementById('value').offsetTop,
	portfolio: document.getElementById('portfolio').offsetTop,
	me: document.getElementById('me').offsetTop,
	contact: document.getElementById('contact').offsetTop,
};

var searchLinkByHash = function(data) {
	for (var z = navLinks.length - 1; z >= 0; z--) {
		if (navLinks[z].hash.slice(1) === data) {
			return navLinks[z];
		}
	};
};

var link = {
	about: searchLinkByHash('about'),
	service: searchLinkByHash('service'),
	value: searchLinkByHash('value'),
	portfolio: searchLinkByHash('portfolio'),
	me: searchLinkByHash('me'),
	contact: searchLinkByHash('contact'),
};

var switchNavigationTab = function(data) {
	if (data.className !== 'active') {
		for (var i = navLinks.length - 1; i >= 0; i--) {
			navLinks[i].classList.remove('active');
		};
		data.classList.add('active');
	}
};

var navigate = function(event, item) {
	if (mobile.any()) {
		var scrollOptions = { speed: 1024, easing: 'easeInOutQuart', updateURL: false, offset: 50 };
		closeNavigation();
	}
	else {
		var scrollOptions = { speed: 768, easing: 'easeInOutQuint', updateURL: false, offset: 50 };
	}
	event.preventDefault();
	var dest = item.hash;
	smoothScroll.animateScroll(null, dest, scrollOptions);
};

toContactBtn.addEventListener('click', function(e) {
	navigate(e, this);
	switchNavigationTab(link.contact);
});

for (var i = navLinks.length - 1; i >= 0; i--) {
	navLinks[i].addEventListener('click', function(e) {
		navigate(e, this);
		switchNavigationTab(this);
	});
};

document.addEventListener('wheel', function(e) {
	var scrolled = window.pageYOffset || document.documentElement.scrollTop;

	if ((scrolled >= section.about) && (scrolled < section.service)) {
		switchNavigationTab(link.about);
	} else if ((scrolled >= section.service) && (scrolled < section.value)) {
		switchNavigationTab(link.service);
	} else if ((scrolled >= section.value) && (scrolled < section.portfolio)) {
		switchNavigationTab(link.value);
	} else if ((scrolled >= section.portfolio) && (scrolled < section.me)) {
		switchNavigationTab(link.portfolio);
	} else if ((scrolled >= section.me) && (scrolled < section.contact)) {
		switchNavigationTab(link.me);
	} else if (scrolled >= section.contact) {
		switchNavigationTab(link.contact);
	}

});

var toggleIcon = document.getElementById('project-logo');
var navigation = document.getElementById('nav');

var openNavigation = function() {
	navigation.classList.add('show-nav');
};

var closeNavigation = function() {
	navigation.classList.remove('show-nav');
};

toggleIcon.addEventListener('tap', function(e) {
	if (navigation.className !== 'show-nav') {
		openNavigation();
	} else {
		closeNavigation();
	}
});