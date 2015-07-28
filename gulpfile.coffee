gulp = require 'gulp'
watch = require 'gulp-watch'
config = require './config'

require './tasks/jade'
require './tasks/stylus'
require './tasks/coffee'
require './tasks/js.vendor'
require './tasks/images'
require './tasks/icons'

gulp.task 'watch', ->
	watch config.watch.stylus.app, ->
		gulp.start 'stylus:app'

	watch config.watch.stylus.vendor, ->
		gulp.start 'stylus:vendor'

	watch config.watch.coffee, ->
		gulp.start 'coffee:app'

	watch config.watch.js.vendor, ->
		gulp.start 'js:vendor'

	watch config.watch.jade, ->
		gulp.start 'jade'

	watch config.watch.icons, ->
		gulp.start 'icons'

	return

gulp.task 'default', ['serve', 'watch']

gulp.task 'build:dev:all',
[
	'stylus:app'
	'coffee:app'
	'jade'
	'imagemin'
	'icons'
	'js:vendor'
	'stylus:vendor'
]

gulp.task 'build:dev',
[
	'stylus:app'
	'coffee:app'
	'jade'
]

gulp.task 'build:production:all',
[
	'stylus:app:production'
	'coffee:app:production'
	'stylus:vendor'
	'js:vendor'
	'imagemin'
	'icons'
	'jade:production'
]

gulp.task 'go', ['build:dev:all'], ->
	gulp.start 'default'