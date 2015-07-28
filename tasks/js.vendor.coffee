gulp = require 'gulp'
plumber = require 'gulp-plumber'
uglify = require 'gulp-uglify'
rigger = require 'gulp-rigger'
config = require '../config'
browserSync = require './serve'

gulp.task 'js:vendor', ->
	gulp.src config.file.vendor.js
		.pipe do plumber
		.pipe do rigger
		.pipe do uglify
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream