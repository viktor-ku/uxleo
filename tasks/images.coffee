gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
browserSync = require('browser-sync').create()
config = require '../config'

gulp.task 'imagemin', ->
	gulp.src config.file.src.image
		.pipe imagemin
			progressive: true
			optimizationLevel: 7
		.pipe gulp.dest config.path.dest.image
		.pipe do browserSync.stream