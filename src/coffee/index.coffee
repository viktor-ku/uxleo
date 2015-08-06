
#= helpers.class.coffee
#= portfolio.class.coffee
#= navigation.class.coffee

portf = new Portfolio
portf.hover '.item', portf.itemEnter, portf.itemLeave
portf.click 'button[data-outlet]', portf.openModal
portf.click '.modal', portf.closeModal

nav = new Navigation
nav.click '[data-nav-target]', nav.clicker.bind nav

if nav.mobile.any()
	document.body.classList.add 'mobile'
	nav.tap '#project-logo', nav.touchlogo.bind nav
else
	document.body.classList.add 'desktop'

do nav.wheelRouteInit