gulp = require 'gulp'
plumber = require 'gulp-plumber'
stylus = require 'gulp-stylus'
csso = require 'gulp-csso'
postcss = require 'gulp-postcss'
autoprefixer = require 'autoprefixer-core'
runSequence = require 'run-sequence'
config = require '../config'
browserSync = require './serve'

gulp.task 'stylus:app', ->
	gulp.src config.file.src.stylus
		.pipe do plumber
		.pipe do stylus
		.pipe gulp.dest config.path.dest.css
		.pipe do browserSync.stream

gulp.task 'post-css', ->
	gulp.src config.file.dest.css
		.pipe postcss [ autoprefixer browsers: ['last 3 versions'] ]
		.pipe do csso
		.pipe gulp.dest config.path.dest.css

gulp.task 'stylus:app:production', ->
	runSequence 'stylus:app', 'post-css'

gulp.task 'stylus:vendor', ->
	gulp.src config.file.vendor.stylus
		.pipe do plumber
		.pipe do stylus
		.pipe do csso
		.pipe gulp.dest config.path.dest.css
		.pipe do browserSync.stream