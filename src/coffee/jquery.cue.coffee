do (jQuery) ->

  $ = jQuery

  STYLE = document.createElement("style")
  document.head.appendChild(STYLE)
  _css = STYLE.sheet
  _indexStyle = 0

  $.fn.cue = ->
    _css.insertRule("h1{color:blue;}", _indexStyle);
