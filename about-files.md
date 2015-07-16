**main information**
```
/old - downloaded code here
/src - all source code here
/dest - code that can be used for production
```

**sources**
```
/src
--- /jade
--- --- /modules
--- --- --- ... # modules like header, navigation etc
--- --- app.jade # include all modules and dest to index.html
--- /stylus
--- --- /vendor
--- --- --- animate-custom.styl
--- --- --- bootstrap.styl
--- --- --- icomoon.styl
--- --- --- ...
--- --- /app
--- --- --- /tools
--- --- --- --- vars.styl
--- --- --- --- mixins.styl
--- --- --- /modules
--- --- --- --- ...
--- --- --- app.styl # include modules and tools
--- /js
--- --- /vendor
--- --- --- ... # all vendor libraries, maybe not min
--- --- /app
--- --- --- app.js
--- /images
--- --- ... # images without optimization, all in the same directories
--- /fonts
--- --- ... > just like they were plus icomoon fonts
```

**distributive**
```
/dest
--- /assets
--- --- /css
--- --- --- vendor.min.css
--- --- --- app.css
--- --- --- app.min.css
--- --- /js
--- --- --- vendor.min.js
--- --- --- app.js
--- --- --- app.min.js
--- --- /images
--- --- --- ... # images after gulp-imagemin, all in the same directories
--- --- /fonts
--- --- --- ... # just like they were plus icomoon fonts
--- index.html # generated with Jade from modules that we used
```