path = require 'path'
gulp = require 'gulp'
sass = require 'gulp-sass'
header = require 'gulp-header'
through = require 'through2'

pkg = require './package.json'
meta = require './meta.json'
banner = '//META{"name":"<%= name %>","description":"<%= description %>","author":"<%= pkg.author %>","version":"<%= pkg.version %>"}*//' + "\n\n"

gulp.task "scss", ->
    gulp.src './src/stylesheets/*.scss'
        .pipe sass { outputStyle: 'expanded' }
        .pipe through.obj (file, enc, callback) ->
            name = path.basename(file.path, ".theme.css")
            transform = header(banner, { name: meta[name].name, description: meta[name].description, pkg: pkg })
            transform._transform(file, enc, callback)
            @push transform.read()
        .pipe gulp.dest './dist/stylesheets'

gulp.task 'default', ['scss']
