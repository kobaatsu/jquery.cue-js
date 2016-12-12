(function(jQuery) {
  var $, STYLE, _css, _indexStyle;
  $ = jQuery;
  STYLE = document.createElement("style");
  document.head.appendChild(STYLE);
  _css = STYLE.sheet;
  _indexStyle = 0;
  return $.fn.cue = function() {
    return _css.insertRule("h1{color:blue;}", _indexStyle);
  };
})(jQuery);
