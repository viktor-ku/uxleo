
class Helpers

	mobile: do ->
		if navigator.userAgent.match(/Android/i) or navigator.userAgent.match(/webOS/i) or navigator.userAgent.match(/iPhone/i) or navigator.userAgent.match(/iPad/i) or navigator.userAgent.match(/iPod/i) or navigator.userAgent.match(/BlackBerry/i) or navigator.userAgent.match(/Windows Phone/i)
			document.body.classList.add 'mobile'
			yes
		else 
			document.body.classList.add 'desktop'
			no

	selector: (nodes) ->
		if nodes? and typeof nodes is 'string' then document.querySelectorAll nodes
		else nodes

	hover: (el, mouseenter, mouseleave) ->
		elements = @selector el
		for el in elements
			el.addEventListener 'mouseenter', mouseenter
			el.addEventListener 'mouseleave', mouseleave
		return

	click: (el, callback) ->
		elements = @selector el
		for el in elements
			el.addEventListener 'click', callback
		return
