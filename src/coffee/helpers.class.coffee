
class Helpers

	selector: (nodes) ->
		if typeof nodes is 'string' and nodes? then document.querySelectorAll nodes
		else if typeof nodes is 'object' and nodes? then nodes
		else return

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
