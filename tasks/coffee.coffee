gulp = require 'gulp'
concat = require 'gulp-concat'
plumber = require 'gulp-plumber'
uglify = require 'gulp-uglify'
coffee = require 'gulp-coffee'
browserSync = require('browser-sync').create()
config = require '../config'

gulp.task 'coffee:app', ->
	gulp.src config.file.src.coffee
		.pipe do plumber
		.pipe do coffee
		.pipe concat 'app.js'
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream

gulp.task 'coffee:app:production', ->
	gulp.src config.file.src.coffee
		.pipe do plumber
		.pipe do coffee
		.pipe concat 'app.js'
		.pipe do uglify
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream