module.exports = (grunt) ->
  dev:
    options:
      bare: true
      sourceMap: false
    files: [
      {
        expand: true
        cwd: '<%= config.src.coffee %>'
        dest: '<%= config.dev %>'
        src: [
          '*.coffee'
          '!_*.coffee'
        ]
        ext: '.cue.js'
      }
    ]
