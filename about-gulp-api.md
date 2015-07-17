###Gulp avaliable commands###  

`$ gulp serve`  
**Browser Sync working now! There are few helpers you'll se through the terminal while working**  

`$ gulp jade`  
**compile /src/jade/app.jade into /dest/index.html**  
**without compressing**  

`$ gulp jade:production`    
**with compressing**  

`$ gulp stylus:app`  
**compile stylus into css**  
`$ gulp stylus:app:production`  
**compile stylus into css**  
**rebuilding css with postcss**  
**a few more optimizations like compress etc with css**  
`$ gulp stylus:vendor`  
**parse one file - vendor.styl into vendor.css**  
**see /src/stylus/vendor/vendor.styl**  

`$ gulp js:app`  
`$ gulp js:app:production`  
`$ gulp js:vendor`  

`$ gulp imagemin`  
**compressing all images**  

`$ gulp watch`  
**watching for everythink you want to change, really :)**  

`$ gulp fonts`  
**copy fonts from /src to /dest**  

`$ gulp build:dev:all`  
**build just everythink from /src into /dest**  
**to make development version of the project**  

`$ gulp build:dev`
**build stylus, jade and js**  

`$ gulp build:production:all`  
**build 'done' project from /src**  

`$ gulp go`  
**builds a dev project and starting the serve and watch**  

`$ gulp`  
**starting serve and watching**  