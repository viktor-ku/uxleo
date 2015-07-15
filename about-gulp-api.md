**Gulp avaliable commands**

`$ gulp serve`  
*make a simple server on port 4400 with livereloading and root is 'dest'*  
*http://localhost:4400/*  

`$ gulp jade`  
*compile /src/jade/app.jade into /dest/index.html*  
*without compressing*  

`$ gulp jade:production`  
*compile /src/jade/app.jade into /dest/index.html*  
*with compressing*  

`$ gulp stylus:app`  
*stylus*  
`$ gulp stylus:app:production`  
*stylus*  
*postcss*  
*optimization, compress*  
`$ gulp stylus:vendor`  
*grab all vendor libraries and min them*  

`$ gulp js:app`  
`$ gulp js:app:production`  
`$ gulp js:vendor`  

`$ gulp imagemin`  
*compressing all images and put them in the same directories like they were*  

`$ gulp watch`  
*watching for*  
*/src/js*  
*/src/jade*  
*/src/stylus*  

`$ gulp fonts`  
*just copy /src/fonts into /dest/assets/fonts*  

`$ gulp build:dev:all`  
*build just everythink from /src into /dest*  
*to make development version of the project*  

`$ gulp build:dev`
*build stylus, jade, js only*  
*without vendors*  

`$ gulp build:production:all`  
*build 'done' project from /src*  

`$ gulp start`  
*build:dev:all && gulp*  

`$ gulp`  
*serve /dest && watch /src && build:dev*  