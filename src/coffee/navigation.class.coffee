
class Navigation extends Helpers

	constructor: ->
		@allLinks = document.getElementById('nav').getElementsByTagName('a')

	section: (name) ->
		document.getElementById name

	burn: (navElement) ->
		for link in @allLinks
			link.classList.remove 'active'
			if link.hash[1...] is navElement then link.classList.add 'active'

	clickLink: (e) ->
		do e.preventDefault
		target = e.target.hash[1...]
		targetNode = document.getElementById target
		targetOffset = targetNode.offsetTop
		TweenLite.to(window, 1, {scrollTo:{y:targetOffset}, ease:Power2.easeInOut})

	route: (original, next) ->
		new Waypoint
			element: @section original
			handler: (direction) -> 
				if direction is 'down' then nav.burn @.element.id
				else if direction is 'up' then nav.burn next
