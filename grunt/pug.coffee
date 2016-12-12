module.exports = (grunt) ->
  dev:
    options:
      pretty: true
    files: [
      {
        expand: true
        cwd: '<%= config.src.sample %>'
        dest: '<%= config.sample %>'
        src: [
          '*.pug'
          '**/*.pug'
          '!_*.pug'
        ]
        ext: '.html'
      }
    ]
