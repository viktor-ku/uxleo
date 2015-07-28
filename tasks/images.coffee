gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
config = require '../config'
browserSync = require './serve'

gulp.task 'imagemin', ->
	gulp.src config.file.src.image
		.pipe imagemin
			progressive: true
			optimizationLevel: 7
		.pipe gulp.dest config.path.dest.image
		.pipe do browserSync.stream