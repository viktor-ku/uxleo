gulp = require 'gulp'
concat = require 'gulp-concat'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
stylus = require 'gulp-stylus'
uglify = require 'gulp-uglify'
watch = require 'gulp-watch'
imagemin = require 'gulp-imagemin'
postcss = require 'gulp-postcss'
autoprefixer = require 'autoprefixer-core'
csso = require 'gulp-csso'
runSequence = require 'run-sequence'
browserSync = require('browser-sync').create()
config = require './config'

gulp.task 'serve', ->
	browserSync.init
		server:
			baseDir: config.root

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

gulp.task 'js:app', ->
	gulp.src config.file.src.js
		.pipe do plumber
		.pipe concat 'app.js'
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream

gulp.task 'js:app:production', ->
	gulp.src config.file.src.js
		.pipe do plumber
		.pipe concat 'app.js'
		.pipe do uglify
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream

gulp.task 'js:vendor', ->
	gulp.src config.file.vendor.js
		.pipe do plumber
		.pipe concat 'vendor.js'
		.pipe do uglify
		.pipe gulp.dest config.path.dest.js
		.pipe do browserSync.stream

gulp.task 'imagemin', ->
	gulp.src config.file.src.image
		.pipe do imagemin
		.pipe gulp.dest config.path.dest.image
		.pipe do browserSync.stream

gulp.task 'watch', ->
	watch 'src/stylus/app/**/*.styl', ->
		gulp.start 'stylus:app'

	watch 'src/js/app/**/*.js', ->
		gulp.start 'js:app'

	watch 'src/jade/**/*.jade', ->
		gulp.start 'jade'

	watch 'src/js/vendor/*.js', ->
		gulp.start 'js:vendor'

	watch 'src/stylus/vendor/**/*', ->
		gulp.start 'stylus:vendor'

	return

gulp.task 'default', ['serve', 'watch']

gulp.task 'build:dev:all',
[
	'stylus:app'
	'js:app'
	'jade'
	'imagemin'
	'js:vendor'
	'stylus:vendor'
]

gulp.task 'build:dev',
[
	'stylus:app'
	'js:app'
	'jade'
]

gulp.task 'build:production:all',
[
	'stylus:app:production'
	'js:app:production'
	'stylus:vendor'
	'js:vendor'
	'imagemin'
	'jade:production'
]

gulp.task 'go', ['build:dev:all'], ->
	gulp.start 'default'