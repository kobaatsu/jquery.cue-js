do (jQuery) ->

  $ = jQuery

  ### 初期設定(起動時に上書き可能) ###
  _config =
    type: 'timing'
    delay: 1000
    scroll: 500
    classNameCued: 'jq_cue-cued'
    property: 'all'
    result: ""
    duration: '.3s'
    easing: 'linear'

  # headに追記可能なスタイルシートを設定
  STYLE = document.createElement("style")
  document.head.appendChild(STYLE)
  _css = STYLE.sheet
  _indexStyle = 0

  $WINDOW = $ window
  TARGET_ELEMENT_SCROLL = if (navigator.userAgent.indexOf('WebKit') < 0) then document.documentElement else document.body

  # ランダムな名前をつける
  createNameRandom = ->
    c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    l = c.length
    result = ""
    while result.length < 8
      result += c[Math.floor(Math.random()*l)]
    return result

  $.fn.cue = (config)->

    # 起動時のconfigを継承
    _config = $.extend _config, config

    _cueing = []

    @each ->
      $this = $ @

      # 適当な名前をつけてそれに対応するCSSとして設定する
      nameClass = "cue-#{createNameRandom()}"
      $this.addClass nameClass

      cssResult = $this.data('cue-result') or _config.result
      type = $this.data('cue-type') or _config.type
      property = $this.data('cue-property') or _config.property
      duration = $this.data('cue-duration') or _config.duration
      easing = $this.data('cue-easing') or _config.easing

      # transitionの設定
      _css.insertRule(".#{nameClass}{transition: #{property} #{duration} #{easing};}", _indexStyle)
      _indexStyle++

      # transition後の設定
      _css.insertRule(".#{nameClass}.#{_config.classNameCued}{#{cssResult}}", _indexStyle)
      _indexStyle++

      if type is 'timing'
        itemCueing =
          $target: $this
          delay: $this.data('cue-value') or _config.delay
        _cueing.push itemCueing
      else if 'scroll'
        threshold = $this.data('cue-value') or _config.scroll
        timer = false
        $WINDOW.on "scroll.#{nameClass}", ->
          clearTimeout timer if timer
          timer = setTimeout ->
            if TARGET_ELEMENT_SCROLL.scrollTop > threshold
              $this.addClass _config.classNameCued
              # unbind
              $WINDOW.off ".#{nameClass}"
              return
          , 10
          return
      return

    if _cueing.length > 0
      $WINDOW.on 'load', ->
        $.each _cueing, ->
          setTimeout =>
            @$target.addClass _config.classNameCued
            return
          , @delay
          return
        return

    return
  return
