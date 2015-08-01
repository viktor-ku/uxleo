
#= helpers.class.coffee
#= portfolio.class.coffee
#= navigation.class.coffee

portf = new Portfolio
portf.hover '.item', portf.itemEnter, portf.itemLeave
portf.click 'button[data-outlet]', portf.openModal
portf.click '.modal', portf.closeModal

nav = new Navigation
nav.click '#nav a', nav.clickLink.bind nav

nav.route 'service', 'about' 
nav.route 'value', 'service'
nav.route 'portfolio', 'value'
nav.route 'me', 'portfolio'
nav.route 'contact', 'me'