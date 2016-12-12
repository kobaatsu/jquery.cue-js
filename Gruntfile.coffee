module.exports = (grunt) ->
  "use strict"

  SRC = "src"
  DEV = "dist"
  DIST = "dist"

  require("load-grunt-config") grunt,
    init: true
    data: config:
      sample: "#{DEV}/sample"
      src:
        root: SRC
        coffee: "#{SRC}/coffee"
        sample: "#{SRC}/sample"
      dev: DEV
      dist: DIST
