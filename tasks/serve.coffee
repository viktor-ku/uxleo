gulp = require 'gulp'
browserSync = require('browser-sync').create()
config = require '../config'

gulp.task 'serve', ->
	browserSync.init
		server: 
			baseDir: config.path.dest.html

module.exports = browserSync