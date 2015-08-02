
class Helpers

	mobile:
		Android: -> window.navigator.userAgent.match(/Android/i)
		BlackBerry: -> window.navigator.userAgent.match(/BlackBerry/i) or window.navigator.userAgent.match(/PlayBook/i) or window.navigator.userAgent.match(/BB/i)
		iOS: -> window.navigator.userAgent.match(/iPhone|iPad|iPod/i)
		Opera: -> window.navigator.userAgent.match(/Opera Mini/i)
		Windows: -> window.navigator.userAgent.match(/IEMobile/i)
		any: -> (@Android() or @BlackBerry() or @iOS() or @Opera() or @Windows())

	getElementByData: (dataAttr, dataInner) ->
		if dataAttr? and dataInner?
			document.querySelector "[data-#{dataAttr}=#{dataInner}]"

	getLinkByTarget: (target) ->
		@element = @getElementByData 'nav-target', target
		@

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
