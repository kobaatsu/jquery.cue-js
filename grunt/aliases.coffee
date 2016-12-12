module.exports = (grunt) ->
  'use strict'

  grunt.registerTask 'js',[
    'coffee:dev'
    'uglify:release'
  ]
  grunt.registerTask 'dev',[
    'clean:dev'
    'pug:dev'
    'js'
  ]
  grunt.registerTask 'default',[
    'dev'
    'connect:live'
    'esteWatch'
  ]
