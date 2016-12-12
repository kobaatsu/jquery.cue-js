module.exports = (grunt) ->
  options:
    dirs: [
      '<%= config.src.root %>/**'
    ]
    livereload:
      enabled: true
      extensions: [
        'coffee'
        'pug'
      ]
  'coffee': (filepath) ->
    [
      'js'
    ]
  'pug': (filepath) ->
    [
      'pug:dev'
    ]
