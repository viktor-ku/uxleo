# 
# define destination and source directories

dest = "dest"
src = "src"

# 
# define where your source/destination paths and files are

config =
	root: "#{dest}/"
	path:
		dest:
			html: "#{dest}/"
			css: "#{dest}/assets/css/"
			js: "#{dest}/assets/js/"
			image: "#{dest}/assets/images/"
	file:
		src:
			jade: "#{src}/jade/index.jade"
			stylus: "#{src}/stylus/app/app.styl"
			js: [
					"#{src}/js/app/core-functions.js"
					"#{src}/js/app/smoothscroll.js"
					"#{src}/js/app/main.js"
				]
			image: "#{src}/images/**/*"
		vendor:
			stylus: "#{src}/stylus/vendor/vendor.styl"
			js: []
		dest:
			css: "#{dest}/assets/css/app.css"

module.exports = config