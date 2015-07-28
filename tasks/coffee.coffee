gulp = require 'gulp'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
uglify = require 'gulp-uglify'
coffee = require 'gulp-coffee'
rigger = require 'gulp-rigger'
rename = require 'gulp-rename'
config = require '../config'
browserSync = require './serve'

gulp.task 'coffee:app', ->
	gulp.src config.file.src.coffee
		.pipe do plumber
		.pipe do rigger
		.pipe do coffee
		.pipe rename 'app.js'
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream

gulp.task 'coffee:app:production', ->
	gulp.src config.file.src.coffee
		.pipe do plumber
		.pipe do rigger
		.pipe do coffee
		.pipe do uglify
		.pipe rename 'app.js'
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream