gulp = require 'gulp'
sass = require 'gulp-sass'

gulp.task "scss", ->
    gulp.src './src/stylesheets/*.scss'
        .pipe sass { outputStyle: 'expanded' }
        .pipe gulp.dest './dist/stylesheets'

gulp.task 'default', ['scss'], ->
    watcher = gulp.watch './src/stylesheets/*.scss', ['scss']
    watcher.on 'change', (event) -> {}
