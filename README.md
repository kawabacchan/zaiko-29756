# アプリケーション名
zaiko-29756

# アプリケーション概要
このアプリケーションは家具メーカーを想定した在庫管理アプリケーションです。
商品や取引企業、企業ごとの店舗、取引先からの注文の登録を行うことができます。
また、事務作業を減らす以下の3つの機能を実装しました。

### 発注リストの表示
在庫が少なくなった商品が自動でリストアップされる機能です。

### エクセルファイルを使った在庫照合
このアプリケーション内で管理している商品の在庫とエクセルファイルの中の在庫の数値の違いを発見する機能です。
これは本社と工場が別の場所にあることを想定しております。
例えば、工場で確認した在庫数をエクセルファイルで受け取り、本社の在庫数との違いがないかを定期的に確認しているメーカーは少なくないです。
この際、ボタン一つで在庫確認ができるため、目視確認と比べ、作業時間や人的ミスを減らすことができます。

### 納期表の作成
納期表を自動で作成する機能です。
取引企業に店舗別の配送日程を現在の日付から自動で算出し、納期が遅れそうな在庫の少ない商品も表示される納期表が作成できます。
A4サイズを想定しています。

# 本番環境

### AWS
http://ec2-34-203-18-194.compute-1.amazonaws.com/

### Basic認証

* ユーザー名: kawabata
* パスワード: 1234


# 制作背景（意図）
在庫管理に伴う事務作業を行っている企業の担当者に対し、作業時間と人的ミスの削減ができると考えたため制作しました。  
私は家具メーカーに勤めた経験があり、在庫管理に伴う事務作業に多大な労力を使っておりました。  
在庫管理に伴う事務作業は毎週金曜日の受付作業が完了し、ほとんどの社員が帰宅した後から始まります。  
その時、自社工場から送付された商品名と在庫数が記載されたエクセルファイルと本社ソフトウェアとの在庫数の照合作業、在庫の少ないものの発注作業、取引企業に対する納期表の作成作業を行っておりました。  
これらの作業を行っている企業は離れた場所に工場を持つメーカーでは少なくないと推測します。  
これらの作業はアプリケーションによって短時間で、かつ、ミスなく完了させることができると考えました。  

# DEMO

### 商品登録機能

![training](https://gyazo.com/0803525b5fbfe5c634aeb4628f950137.gif)

一括登録
![training](https://gyazo.com/aab0d00cb035dee9e2fd600f12657f49.gif)

### 企業登録

![training](https://gyazo.com/37e7fe92e970cf470638861962000900.gif)

一括登録
![training](https://gyazo.com/9c55b9ead67b8136b6adb505e0a0e91f.gif)

一括登録つづき（店舗情報も同時に登録可能）
![training](https://gyazo.com/9fba494b3df31df4b61cb80aea6d16e3.gif)

### 注文登録

![training](https://gyazo.com/0dabe24ac88927a473933d8905386451.gif)

### 発注リスト作成機能
黄色セルを発注依頼リスト、赤色セルを最優先発注依頼リストとして表示する。

![training](https://gyazo.com/2e79464e3aea41e5ecb6faa91ab106a5.gif)

### 在庫照合機能
商品と在庫数が記入されたエクセルファイルを用意し、アプリケーションで読み込むと在庫数が違う商品が表示される。
また、エクセルファイルとアプリケーションの片方にしか存在しない商品も表示される。
![training](https://gyazo.com/cfdc814bc8227ab402117a986e430c15.gif)

### 納期表作成機能

![training](https://gyazo.com/b0b586349e22a743f2a985f0cb076221.gif)


# 使用技術(開発環境)

### バックエンド
Ruby, Ruby on Rails

### フロントエンド
HTML, CSS, JavaScript

### データベース
MySQL

### Webサーバー(本番環境)
AWS EC2

### アプリケーションサーバ(本番環境)
AWS EC2

### データベース(本番環境)
AWS EC2

### ソース管理
GitHub, GitHubDesktop

### テスト
RSpec

### エディタ
VSCode


# 開発予定

### AWSを使ったデプロイ(2020/11/6完了済み)
~~本アプリケーションはHerokuにデプロイしていますが、AWSを学習後、EC2にデプロイを行う予定です。~~

### 商品確保機能
注文が確定していない状態で、商品の確保のみを取引先より依頼された際に、商品の確保ができる機能です。  

### 注文集計機能
注文数を取引先ごとに集計する機能です。


# ER図
![training](https://gyazo.com/ccc6f9103a4817c249811ff120727b39.png)

# テーブル設計

## itemsテーブル

| Column        | type    | option      |
| ------------- | ------- | ----------- |
| category_id   | integer | null: false |
| code          | string  | null: false |
| name          | string  | null: false |
| stock         | integer | null: false |
| monthly_sales | integer | null: false |

### Association

- has_many :delivery_dates
- has_many :orders
- has_many :shops, through: orders


## companysテーブル

| Column        | type    | option      |
| ------------- | ------- | ----------- |
| name          | string  | null: false |

### Association

- has_many :shops


## shopsテーブル

| Column        | type       | option      |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| code          | string     | null: false |
| prefecture_id | integer    | null: false |
| delibery_days | integer    | null: false |
| company       | references | null: false |

### Association

- belongs_to :company
- has_many :orders
- has_many :items, through: orders


## ordersテーブル

| Column        | type        | option      |
| ------------- | ----------- | ----------- |
| sales_numbers | integer     | null: false |
| item          | references  | null: false |
| shop          | references  | null: false |

### Association

- belongs_to :item
- belongs_to :shop
