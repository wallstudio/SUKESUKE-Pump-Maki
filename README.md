# SUKESUKE-Pump-Maki
M様のところのMさんをスケスケに  
## [解説動画（ニコニコ）](http://www.nicovideo.jp/watch/sm30639529) 
[![サムネイル](https://wallstudio.github.io/SUKESUKE-Pump-Maki/video_thum.jpg)](http://www.nicovideo.jp/watch/sm30639529) 

## これは何？  
ニコニコ動画で活動中のﾐｽﾘﾙ氏（[Twitter:@gudarinn120](https://twitter.com/gudarinn120)）の[「結月ゆかりがシャイン120枚頑張って集める実況」シリーズ](http://www.nicovideo.jp/mylist/56866478)の為に作ったAviUtlのアニメーション効果です．ゲーム画面のインジケーターの色情報と，音声を解析してオブジェクトのパラメーターを自動で操作してくれます．  
専用に開発しましたが，lib_Shineshine.luaを参考に，Weightとborderを調節してあげれば他にも使えると思います．

## 動作確認済み環境
* aviutl_plus_20120619(AviUtlと拡張編集Plugin等のセット)

## インストール
1. [最新版リリース](https://github.com/wallstudio/SUKESUKE-Pump-Maki/releases)をダウンロード
2. Zipなので適当なアプリで展開（「script」フォルダや「README.md」が出てくるはず）
3. AviUtlのインストールフォルダを開く（「AviUtl.exe」とか「読んでね」があるフォルダ）
4. 拡張編集プラグインがインストールされたフォルダの中に展開した「script」フォルダをコピー（セット版で導入した場合は「plugins」フォルダの中）

## 使い方
1. 解析したい**ゲーム画面**にアニメーション効果**「線形ｹﾞｰｼﾞ解析@SUKESUKE-Pump-Maki」**を追加し，メインウィンドウに表示される丸が**タンクの上端と下端**に来るように調整（間に余計なものが入らないようにする）．
2. **透かしたい着衣差分**にアニメーション効果**「タンク@SUKESUKE-Pump-Maki」**を追加．
3. **ゲーム画面**にアニメーション効果の**「円形ｹﾞｰｼﾞ解析@SUKESUKE-Pump-Maki」**を追加し，円の中心が**インジケーターのセルの中心**に来るように調整．
4. **大破させたい着衣差分**にアニメーション効果**「HP@SUKESUKE-Pump-Maki」**を追加し，**大破させたい部分**に円の中心が来るように調整（順番に大破していく）．
5. 同様に**ゲーム画面**にアニメーション効果の**「放水音解析@SUKESUKE-Pump-Maki」**を追加（実験用にすると波形が見られる，効果は同じ）．
6. **放水動画**（サンプルでは[nc53992](http://commons.nicovideo.jp/material/nc53992)を使用）にアニメーション効果**「放水@SUKESUKE-Pump-Maki」**を追加し，**閾値**を調整．

## 各パラメータ
変更の必要があるものは「使い方」に書いてあるものくらいでなので，**気になったところだけ読めば大丈夫**です．  
「―」や名前のついていないものはダミー，もしくは**変更してはいけない値**．
  
### 線形ｹﾞｰｼﾞ解析
* 設定->名前：タンクと関連付けるための識別名．基本的に変更しなくていいが，ゲーム画面を二つ表示したいときなどはこれを変更して対応させる．
* 位置確認：メインウィンドウの円が見にくい時に，ONにすると協調される．ただしONになっていると正しく解析されないので調節したらOFFにする．
  
### 円形ｹﾞｰｼﾞ解析
* 設定->名前：HPと関連付けるための識別名．基本的に変更しなくていいが，ゲーム画面を二つ表示したいときなどはこれを変更して対応させる．
* 位置確認：メインウィンドウの円が見にくい時に，ONにすると協調される．ただしONになっていると正しく解析されないので調節したらOFFにする．
  
### 放水音解析
* 設定->名前：放水と関連付けるための識別名．音は全体から拾ってくるので増やせない，よって変更する必要はない．
* 設定->バッファ数：この値分のフレームの平均で相関を計算する．60fpsなら値が32でおよそ0.5秒のタイムラグが生じるので，タイムラグが気になるときに下げると俊敏に反応する．しかし精度が急激に悪くなる．逆に大きくしてもよくなるとは限らない．
* 設定->分割数：下げると軽くなるが，精度が大きく悪くなる．上げてもほとんど良くならない．
  
### タンク
* 設定->名前：線形ｹﾞｰｼﾞ解析と関連付けるための識別名．基本的に変更しなくていいが，ゲーム画面を二つ表示したいときなどはこれを変更して対応させる．
* 設定->対象：「alpha」で透明度に関連づけられる．「zoom」とかにすると拡大率に関連づけられる．
* 設定->曲線：最初はあまり変化せず，後の方で一気に変化…などができる．Logisticは真ん中辺りで一気に変化しまたゆっくり変化，Linearは等速，Logは減速，Powは加速．
  
### HP
* 破れの大きさ：一つ一つの破れの大きさ．
* ｵﾌｾｯﾄX(ﾗﾝﾀﾞﾑ)：横方向にずれる（ランダムの時だけ有効）．
* ｵﾌｾｯﾄY(ﾗﾝﾀﾞﾑ)：縦方向にずれる（ランダムの時だけ有効）．
* ばらけ(ﾗﾝﾀﾞﾑ)：破れが収まる範囲（ランダムの時だけ有効）．
* 設定->名前：円形ｹﾞｰｼﾞ解析と関連付けるための識別名．基本的に変更しなくていいが，ゲーム画面を二つ表示したいときなどはこれを変更して対応させる．
* 設定->固有名：オブジェクトの識別子．複数のオブジェクトに設定したいときは全て違う名前でないといけない．
* 設定->曲線：最初はあまり変化せず，後の方で一気に変化…などができる．Logisticは真ん中辺りで一気に変化しまたゆっくり変化，Linearは等速，Logは減速，Powは加速．
* 設定->シード：乱数生成の為の値．ランダムにしたとき，ばらけ方が不満だったらこの値を変えるとばらけ方が変わる．逆にここの値が同じなら別のプロジェクトや別の日でも同じばらけ方になる．
* ランダム：破れ位置を手動で設定するのが面倒ならONにすると適当に破ってくれる（結構不自然）．
  
### 放水
* 設定->名前：放水音解析と関連付けるための識別名．「放水音解析（実験用）」を使うときはそちらの識別名に合わせる必要がある（デフォルトでは普通の「放水音解析」効果に関連づいてる）．
* 設定->対象：「alpha」で透明度に関連づけられる．0か1しかないので「zoom」にしても効果はたぶん同じ．
* 閾値：放水とみなす相関量．小さくすると放水の判定が甘くなる．音量に依存するため，音量を下げたときは少し小さくするといい．
  
### 放水音解析(実験用)
* ｵﾌｾｯﾄX：横方向にずれる．
* ｵﾌｾｯﾄY：縦方向にずれる．
* 拡大X：横方向に拡大．
* 拡大Y：縦方向に拡大．
* 設定->名前：放水と関連付けるための識別名．音は全体から拾ってくるので増やせない，よって変更する必要はない．
* 設定->バッファ数：この値分のフレームの平均で相関を計算する．60fpsなら値が32でおよそ0.5秒のタイムラグが生じるので，タイムラグが気になるときに下げると俊敏に反応する．しかし精度が急激に悪くなる．逆に大きくしてもよくなるとは限らない．
* 設定->バッファ数2：微分値の平均の為のバッファ数
* 設定->分割数：下げると軽くなるが，精度が大きく悪くなる．上げてもほとんど良くならない．
* 設定->点サイズ：画面に描画されるグラフの太さ．
* 閾値：放水とみなす相関量．小さくすると放水の判定が甘くなる．音量に依存するため，音量を下げたときは少し小さくするといい．放水とみなすと灰色の放水時サンプルのグラフが青くなる．
* 学習：周波数スペクトラムの平均を記録してくれる．OFFのままでOK．

## Lisence
Copyright &copy; 2017 Wall Studio  
Released under the MIT license  
Included exedit.anm in AviUtl Exedit Pulugin by Ken  