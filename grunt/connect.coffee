module.exports = (grunt) ->
  live:
    options:
      port: 9000
      hostname: 'localhost'
      open: 'http://localhost:9000/sample/'
      base: '<%= config.dev %>/'
      directives:
        'error_log': require('path').resolve('logs/error.log')
  keep:
    options:
      port: 9000
      hostname: 'localhost'
      open: 'http://localhost:9000/sample/'
      base: '<%= config.dev %>/'
      keepalive: true
