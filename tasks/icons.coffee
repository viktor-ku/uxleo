gulp = require 'gulp'
svgmin = require 'gulp-svgmin'
browserSync = require('browser-sync').create()
config = require '../config'

gulp.task 'icons', ->
	gulp.src config.file.src.icons
		.pipe do svgmin
		.pipe gulp.dest config.path.dest.icons
		.pipe do browserSync.stream