gulp = require 'gulp'
browserSync = require('browser-sync').create()
config = require '../config'

gulp.task 'serve', ->
	browserSync.init
		server: config.path.dest.html