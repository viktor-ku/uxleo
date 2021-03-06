# 
# define destination and source directories

dest = "public"
src = "src"

# 
# define where your source/destination paths and files are

config =
	path:
		dest:
			html: "#{dest}/"
			css: "#{dest}/assets/css/"
			js: "#{dest}/assets/js/"
			image: "#{dest}/assets/images/"
			icons: "#{dest}/assets/icons/"
	file:
		src:
			jade: "#{src}/jade/index.jade"
			stylus: "#{src}/stylus/app/app.styl"
			coffee: "#{src}/coffee/index.coffee"
			js: [
					"#{src}/js/app/intro/i.js"
					"#{src}/js/app/core-functions.js"
					"#{src}/js/app/mobile.js"
					"#{src}/js/app/main.js"
					"#{src}/js/app/intro/o.js"
				]
			image: "#{src}/images/**/*"
			icons: "#{src}/icons/**/*"
		vendor:
			stylus: "#{src}/stylus/vendor/vendor.styl"
			js: "#{src}/js/vendor/vendor.js"
		dest:
			css: "#{dest}/assets/css/app.css"
	watch:
		coffee: "#{src}/coffee/**/*.coffee"
		stylus:
			app: "#{src}/stylus/app/**/*.styl"
			vendor: "#{src}/stylus/vendor/vendor.styl"
		js:
			app: "#{src}/js/app/**/*.js"
			vendor: "#{src}/js/vendor/vendor.js"
		jade: "#{src}/jade/**/*.jade"
		icons: "#{src}/icons/**/*.svg"

module.exports = config