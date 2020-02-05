#  ポートフォリオ
##  目次
* 目次
* 概要
* ポートフォリオを制作した動機
* 「Ruby on Rails」を選んだ理由
* 制作の過程
* 制作時の問題と今後の課題
* アプリの解説
  * アプリ情報
  * 機能紹介
    * ログイン機能
    * 企業管理機能
    * スケジュール管理機能

##  概要
* アプリ名: 就活カレンダー
* URL: <https://floating-mountain-10800.herokuapp.com/>
* 言語: HTML, CSS, Ruby
* フレームワーク: Ruby on Rails
* OS: Windows

## ポートフォリオを制作した動機
就職活動をするにあたり、以下の利点があると考えポートフォリオの制作に至りました。
* 就職活動において不便に感じていた点を、自作アプリで解消することで、効率的な活動を行うことができる。
  * 就職活動では、「企業情報の管理」と「スケジュールの管理」を行う必要があります。
  しかし、これらを1か所で管理するために適したサービスが見つからず、それぞれ独立して管理せざるを得ませんでした。
  今回制作したアプリは、同時に管理することを可能にすることで、より効率的な活動を行えるようにすることを目的としています。
* IT技術者の適性があるか確認できる。
  * ポートフォリオを制作する前は、物理学の授業での数値計算や趣味レベルのプログラミング経験しかありませんでした。
  そのため、ITエンジニアというキャリアに興味を持つも、はたして自分に適性があるのかという疑念が生じました。
  そこで、ポートフォリオの制作を通して、適性を確認することを考えました。
* 自分の強みのアピールにできる。
  * 自分の強みは、忍耐強く努力して新たな知識を身につけることができる点だと考えています。
  独学でポートフォリオを制作することができれば、この強みのアピールに説得力をもたせることができると考えました。

## 「Ruby on Rails」を選んだ理由
制作するにあたりネックとなったのは、言語の知識がないことと開発の経験がないこと、制作に当てる時間が少ないことでした。
そのため、以下を満たす言語である必要がありました。
1. ネット上に知識の蓄積が十分にあり、必要な情報を得ることができる。
2. 開発レベルまでの知識を得られる情報源がある。
3. 学習コストが低い。

これに対して、Ruby on Railsは次のように条件を満たすと考えました。
1. 世界的に用いられてきた言語であり、知識の蓄積は多い。日本で開発された言語ということもあり、日本語の情報も豊富である。
2. 「Ruby on Railsチュートリアル(<https://railstutorial.jp/>)」という質の高い情報源がある。
3. 様々な転職サイトやプログラミングスクールのサイトで「Ruby on Rails」を未経験者に勧める記事があったため、比較的学習コストは低いと考えた。

##  制作の過程
12月初旬に制作を決意したあとの、制作の過程はおおよそ次の通りです。

* 12月初旬:
  * 制作のための情報収集, Ruby・HTML・CSSの基礎知識の勉強   
* 12月中旬~下旬
  * Ruby on Railsチュートリアルの学習
* 1月上旬
  * ログイン機能の制作
* 1月中旬
  * 企業情報管理機能の制作
* 1月下旬~2月上旬
  * スケジュール管理機能の制作, ポートフォリオ制作

##  制作時の問題と今後の課題
制作の際には、主に以下のように問題が起こり、対処しました。
* 知識・経験の不足
  * [問題]  
  Rubyの知識不足により、不必要に煩雑なコードが多くなりました。これらを後から修正することも多く、時間がかかる原因となっていました。  
  また、JavaScriptやjQueryなどのフロントエンドの知識不足により、制作できる機能が大きく制限されてしまいました。  
  他にも、アルゴリズムの知識不足により、カレンダーの表示の処理などが煩雑で無駄の多いものとなりました。
  * [対処]  
  過去の蓄積から似たような機能がないか調べてから制作することで、無駄をできる限り省く努力をしました。
* 時間の不足
  * [問題]  
  研究との両立により、制作に当てられる時間は平均して1日2時間程度でした。
  * [対処]  
  なるべく連続的に作業ができるようにスケジュールを調整し、集中して作業できるようにしました。
  また、その日の問題点をきちんと記録することで、次回にコードを見返す時間を最小化しました。

今後の課題としては、知識を増やし実装できなかった機能を追加できるようにすることが一番に挙げられます。
また、スケジューリングに甘い部分があったため、そこも見直したいと考えています。

## アプリの解説
### アプリ情報
URL: <https://floating-mountain-10800.herokuapp.com/>  
必要であれば、以下のサンプルユーザーをご利用ください。  
E-mail: example_at_example.com  
password: password

###  機能紹介
アプリは、次の3つの機能に分けられます。
1. ログイン機能
2. 企業情報管理機能
3. スケジュール管理機能

それぞれについて、主な機能は次の通りです。

#### 1.ログイン機能

* ユーザーアカウントの登録機能
  * アカウント登録されたとき、登録されたメールアドレスに有効化メールを送り、リンクのクリックによりアカウントを有効化する。
* ログイン機能
  * 有効化されたアカウントにログインできる。
  * 任意でクッキーにログイン情報を保存し、次回起動時に自動でログインできる。
* ログアウト機能
  * アカウントをログアウトできる。
* パスワードリセット機能
  * 登録されたメールアドレスにパスワードリセットメースを送り、リンクのクリックによりパスワードリセットページにアクセスできる。
  
#### 2.企業情報管理機能
* 企業情報登録機能
  * 企業とそのデータを登録できる。
* 企業情報表示・編集機能
  * 企業情報とスケジュールを同時に表示し、編集できる。
* 企業情報削除機能
  * 企業情報と関連するスケジュールを同時に削除できる。

#### 3.スケジュール管理機能
* スケジュール登録機能
  * スケジュールを登録できる。任意で企業と結びつけることができる。
* カレンダー機能
  * 一月分のカレンダーとスケジュールを表示し、クリックでスケジュール編集画面に移動できる。
* スケジュール編集機能
  * スケジュールを編集できる。
* スケジュール削除機能
  * スケジュールを削除できる。
