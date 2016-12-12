# jquery.cue.js

ロード後のタイミング、またはスクロール量で指定したDOMに任意のtransitionを設定する（だけの）jQueryプラグインです。

## 使い方

```html
  <div id="sample" data-cue-type="timing" data-cue-value="3000" data-cue-result="opacity:0;color:green;" data-cue-duration=".5s" data-cue-easing="linear">3秒後に透明になる</div>
```

`data-cue-(property)=(setting)` の形でDOMに設定を書きます。指定しない場合カッコ内の設定が適用されます。

- type: "timing|scroll" (timing)  
読み込み後の時間またはスクロールで発火
- value: 数値 (timing: 1s scroll: 500px)  
発火するタイミングまたはスクロール量
- result: CSS ("")  
結果のスタイル
- duration: 秒 (0.3s)  
アニメーション時間
- easing: キーワードまたはベジェ ("linear")  
アニメーションの変化タイミング

```js
  $('#sample').cue();
```

初期化します。

HTMLに直接書かずに初期化のときに設定を書くこともできます。

```js
  $('#sample').cue({
    type: "timing"
  });
```
