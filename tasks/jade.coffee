gulp = require 'gulp'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
config = require '../config'
browserSync = require './serve'

gulp.task 'jade', ->
	gulp.src config.file.src.jade
		.pipe do plumber
		.pipe jade pretty: true
		.pipe gulp.dest config.path.dest.html
		.pipe do browserSync.stream

gulp.task 'jade:production', ->
	gulp.src config.file.src.jade
		.pipe do plumber
		.pipe do jade
		.pipe gulp.dest config.path.dest.html
		.pipe do browserSync.stream