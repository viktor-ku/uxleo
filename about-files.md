**main information**
```
/src - all source code here
/dest - code that can be used for production
```

**sources**
```
/src
--- /bower
--- --- # all vendor libraries here
--- /images
--- --- # images without optimization, all in the same directories
--- /jade
--- --- /modules
--- --- --- # modules like header, navigation etc
--- --- app.jade
--- /js
--- --- /app
--- --- --- app.js
--- /stylus
--- --- /app
--- --- --- /tools
--- --- --- --- # tools like mixins here
--- --- --- /modules
--- --- --- --- # all modules
--- --- --- app.styl # include modules and tools
--- --- /vendor
--- --- --- vendor.styl # here we include all vendor styl from /src/bower
--- /fonts
--- --- # diffrenet fonts if you need
```

**distributive**
```
/dest
--- /assets
--- --- /css
--- --- --- vendor.css
--- --- --- app.css
--- --- /images
--- --- --- # images after gulp-imagemin
--- --- /js
--- --- --- vendor.js
--- --- --- app.js
--- --- /fonts
--- --- --- # just copy, nothing to do with them yet
--- index.html # generated from app.jade
```