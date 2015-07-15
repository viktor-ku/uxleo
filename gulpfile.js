var gulp, concat, connect, jade, plumber, stylus, uglify, watch, imagemin, rename, postcss, autoprefixer, csso, runSequence;

var go = function(data) {
	if (data === 'gulp')
		return require('gulp');
	else
		return require('gulp-' + data);
};

gulp = go('gulp');
concat = go('concat');
connect = go('connect');
jade = go('jade');
plumber = go('plumber');
stylus = go('stylus');
uglify = go('uglify');
watch = go('watch');
imagemin = go('imagemin');
rename = go('rename');
postcss = go('postcss');
autoprefixer = require('autoprefixer-core');
csso = go('csso');
runSequence = require('run-sequence');

gulp.task('serve', function() {
	connect.server({
		port: 4400,
		root: 'dest/',
		livereload: true
	});
});

gulp.task('jade', function() {
	return gulp.src('src/jade/app.jade')
		.pipe(plumber())
		.pipe(jade({ pretty: true }))
		.pipe(rename('index.html'))
		.pipe(gulp.dest('dest/'))
		.pipe(connect.reload());
});

gulp.task('jade:production', function() {
	return gulp.src('src/jade/app.jade')
		.pipe(plumber())
		.pipe(jade())
		.pipe(rename('index.html'))
		.pipe(gulp.dest('dest/'))
		.pipe(connect.reload());
});

gulp.task('stylus:app', function() {
	return gulp.src('src/stylus/app/app.styl')
		.pipe(plumber())
		.pipe(stylus())
		.pipe(gulp.dest('dest/assets/css/'))
		.pipe(connect.reload());
});

gulp.task('compile-stylus', function() {
	return gulp.src('src/stylus/app/app.styl')
		.pipe(plumber())
		.pipe(stylus())
		.pipe(gulp.dest('dest/assets/css/'))
		.pipe(connect.reload());
});

gulp.task('postcss', function() {
    return gulp.src('dest/assets/css/app.css')
        .pipe(postcss([ autoprefixer({ browsers: ['last 3 versions'] }) ]))
        .pipe(gulp.dest('dest/assets/css/'));
});

gulp.task('refactor-css', function() {
	return gulp.src('dest/assets/css/app.css')
		.pipe(csso())
		.pipe(gulp.dest('dest/assets/css/'));
});

gulp.task('stylus:app:production', function() {
	return runSequence(
		'compile-stylus',
		'postcss',
		'refactor-css'
	);
});

gulp.task('stylus:vendor', function() {
	return gulp.src('src/stylus/vendor/*.styl')
		.pipe(plumber())
		.pipe(stylus())
		.pipe(concat('vendor.css'))
		.pipe(csso())
		.pipe(gulp.dest('dest/assets/css/'))
		.pipe(connect.reload());
});

var appLoad = function(data) {
	return 'src/js/app/' + data + '.js';
};

var appOrder = [
	appLoad('main')
];

var vendorLoad = function(data) {
	return 'src/js/vendor/' + data + '.js';
};

var vendorOrder = [];

gulp.task('js:app', function() {
	return gulp.src(appOrder)
		.pipe(plumber())
		.pipe(concat('app.js'))
		.pipe(gulp.dest('dest/assets/js/'))
		.pipe(connect.reload());
});

gulp.task('js:app:production', function() {
	return gulp.src(appOrder)
		.pipe(plumber())
		.pipe(concat('app.js'))
		.pipe(uglify())
		.pipe(gulp.dest('dest/assets/js/'))
		.pipe(connect.reload());
});

gulp.task('js:vendor', function() {
	return gulp.src(vendorOrder)
		.pipe(plumber())
		.pipe(concat('vendor.js'))
		.pipe(uglify())
		.pipe(gulp.dest('dest/assets/js/'))
		.pipe(connect.reload());
});

gulp.task('imagemin', function() {
	return gulp.src('src/images/**/*')
		.pipe(imagemin({
			progressive: true,
			interlaced: true,
			optimizationLevel: 7
		}))
		.pipe(gulp.dest('dest/assets/images/'))
		.pipe(connect.reload());
});

gulp.task('watch', function() {
	watch('src/stylus/app/**/*.styl', function() {
		gulp.start('stylus:app');
	});

	watch('src/js/app/**/*.js', function() {
		gulp.start('js:app');
	});

	watch('src/jade/**/*.jade', function() {
		gulp.start('jade');
	});

	watch('src/js/vendor/*.js', function() {
		gulp.start('js:vendor');
	});

	watch('src/stylus/vendor/*', function() {
		gulp.start('stylus:vendor');
	});
});

gulp.task('fonts', function() {
	return gulp.src('src/fonts/**/*')
		.pipe(gulp.dest('dest/assets/fonts/'))
		.pipe(connect.reload());
});

gulp.task('default', [
	'serve', 'watch', 'build:dev'
]);

gulp.task('build:dev:all', [
	'stylus:app', 'js:app', 'jade', 'fonts', 'imagemin', 'js:vendor', 'stylus:vendor'
]);

gulp.task('build:dev', [
	'stylus:app', 'js:app', 'jade'
]);

gulp.task('build:production:all', [
	'stylus:app:production', 'js:app:production', 'stylus:vendor', 'js:vendor', 'fonts', 'imagemin', 'jade:production'
]);

gulp.task('start', function() {
	return runSequence(
		'build:dev:all',
		'default'
	);
});