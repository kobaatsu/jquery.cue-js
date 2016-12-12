module.exports = (grunt) ->
  release:
    files:[
      {
        src: [
          '<%= config.dist %>/jquery.cue.js'
        ]
        dest : '<%= config.dist %>/jquery.cue.min.js'
      }
    ]
