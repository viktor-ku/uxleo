gulp = require 'gulp'
svgmin = require 'gulp-svgmin'
config = require '../config'
browserSync = require './serve'

gulp.task 'icons', ->
	gulp.src config.file.src.icons
		.pipe do svgmin
		.pipe gulp.dest config.path.dest.icons
		.pipe do browserSync.stream