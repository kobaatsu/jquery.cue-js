(function(jQuery) {
  var $, STYLE, TARGET_ELEMENT_SCROLL, _config, _css, _indexStyle, createNameRandom;
  $ = jQuery;

  /* 初期設定(起動時に上書き可能) */
  _config = {
    type: 'timing',
    delay: 1000,
    scroll: 500,
    classNameCued: 'jq_cue-cued',
    property: 'all',
    result: "",
    duration: '.3s',
    easing: 'linear'
  };
  STYLE = document.createElement("style");
  document.head.appendChild(STYLE);
  _css = STYLE.sheet;
  _indexStyle = 0;
  TARGET_ELEMENT_SCROLL = navigator.userAgent.indexOf('WebKit') < 0 ? document.documentElement : document.body;
  createNameRandom = function() {
    var c, l, result;
    c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    l = c.length;
    result = "";
    while (result.length < 8) {
      result += c[Math.floor(Math.random() * l)];
    }
    return result;
  };
  $.fn.cue = function(config) {
    _config = $.extend(_config, config);
    this.each(function() {
      var $this, cssResult, delay, duration, easing, nameClass, property, threshold, timer, type;
      $this = $(this);
      nameClass = "cue-" + (createNameRandom());
      $this.addClass(nameClass);
      cssResult = $this.data('cue-result') || _config.result;
      type = $this.data('cue-type') || _config.type;
      property = $this.data('cue-property') || _config.property;
      duration = $this.data('cue-duration') || _config.duration;
      easing = $this.data('cue-easing') || _config.easing;
      _css.insertRule("." + nameClass + "{transition: " + property + " " + duration + " " + easing + ";}", _indexStyle);
      _indexStyle++;
      _css.insertRule("." + nameClass + "." + _config.classNameCued + "{" + cssResult + "}", _indexStyle);
      _indexStyle++;
      if (type === 'timing') {
        delay = $this.data('cue-value') || _config.delay;
        setTimeout(function() {
          $this.addClass(_config.classNameCued);
        }, delay);
      } else if ('scroll') {
        threshold = $this.data('cue-value') || _config.scroll;
        timer = false;
        $(window).on("scroll." + nameClass, function() {
          if (timer) {
            clearTimeout(timer);
          }
          timer = setTimeout(function() {
            if (TARGET_ELEMENT_SCROLL.scrollTop > threshold) {
              $this.addClass(_config.classNameCued);
              $(window).off("." + nameClass);
            }
          }, 10);
        });
      }
    });
  };
})(jQuery);
