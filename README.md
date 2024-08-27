# アプリケション名
**ドコイク？**
# アプリケーション概要
食べ物の評価ではなく、お店やスタッフの雰囲気の評価で居酒屋を投稿、レビュー、検索することができる。
# URL
https://dokoiku-1a0q.onrender.com
# テスト用アカウント
- Basic認証パスワード:2222
- Basic認証ID:admin
- メールアドレス:test@test.com
- パスワード:a111111

# 利用方法
## ユーザー登録
- トップページ（検索画面）のヘッダーからユーザー新規登録を行う
## お店投稿
1. 新しいお店を投稿ボタンから投稿画面に遷移し、地図のピンをドラッグしお店の場所を指定

2. お店の基本情報（お店の名前、料理ジャンル、営業時間、定休日、住所、電話番号、追加情報）入力（料理ジャンル、電話番号、追加情報は任意）

3. 支払い方法（一つ以上）、価格帯（必須）、Wifi（任意）、タバコ（任意）をチェック

4. レビュー項目をチェックし、コメント入力（コメントは任意）

5. 画像をアップロード（任意）

6. 投稿するボタンで投稿

## お店の検索
### 店名で検索
- トップページ（検索画面）の「店名で検索する」の入力フォームを入力後、検索ボタン

### 雰囲気で検索
- 求めている条件のみチェックし、検索ボタン

## レビュー投稿
1. お店詳細画面からレビューを投稿するボタンでレビュー投稿画面へ遷移

2. レビュー項目にチェック、コメント入力（任意）画像アップデート（任意）後、レビューを投稿するボタン

# アプリケーションを作成した背景
お酒を飲みに行く友人にヒアリングした際、「ゆっくり一人飲みしようと思ったら、お店がうるさくてすぐ退店した」「複数人でワイワイ飲もうと思ったら、静かなお店で話しづらく、すぐ退店した」というお店選びでの画題が見つかった。課題を分析した結果、お酒の場が好きな方は、料理より居心地の良さを優先するという仮説を立てた。同様の課題を抱えている方も多いと推測し、場の雰囲気（お店の雰囲気、スタッフの雰囲気）でお店を評価し、検索することができるアプリケーションを開発することにした。


# 実装予定の機能
- レビューに対するコメント機能
- ユーザーランキング機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/219bbd7b8cc47db1967fdbe70311e9ff.png)](https://gyazo.com/219bbd7b8cc47db1967fdbe70311e9ff)


# テーブル設計

## users テーブル
| Colum               | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| gender_id           | integer   | null: false |
| age_group_id        | integer   | null: false |
| profile             | text      |             |

### Association

- has_many :shops
- has_many :reviews


## shops テーブル
| Colum                 | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| shop_name             | string     | null: false                    |
| cuisine_type          | string     |                                |
| closed_days           | string     | null: false                    |
| opening_hours         | string     | null: false                    |
| address               | string     | null: false                    |
| phone_number          | string     |                                |
| additional_info       | text       |                                |
| wifi                  | string     |                                |
| smoking               | string     |                                |
| payment_methods       | string     | null: false, default: ""       |
| price_range           | string     | null: false                    |
| latitude              | decimal    | precision: 17, scale: 14       |
| longitude             | decimal    | precision: 17, scale: 14       |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :reviews, dependent: :destroy


## reviews テーブル
| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| cleanliness     | integer    | null: false, default: 0        |
| space           | integer    | null: false, default: 0        | 
| lighting        | integer    | null: false, default: 0        |
| music           | integer    | null: false, default: 0        |
| vibrancy        | integer    | null: false, default: 0        |
| order_speed     | integer    | null: false, default: 0        |
| service_style   | integer    | null: false, default: 0        |
| conversation    | integer    | null: false, default: 0        |
| description     | text       |                                |
| user            | references | null: false, foreign_key: true |
| shop            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shop

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5b15a0cae2bc413b63cc1f43d390356d.png)](https://gyazo.com/5b15a0cae2bc413b63cc1f43d390356d)

# 開発環境
## フロントエンド
- **テンプレートエンジン**: HTML.erb
- **スタイルシート**: CSS
- **地図ライブラリ**: Leaflet.js（バージョン: `^1.9.4`）

## バックエンド
- **言語**: Ruby 3.2.0
- **フレームワーク**: Ruby on Rails 7.0.0
- **データベース**: MySQL（開発・テスト）、PostgreSQL（本番）
- **ウェブサーバ**: Puma 5.0
- **認証**: Devise
- **ファイルアップロード**: Active Storage + MiniMagick

## インフラ
- **ホスティングサービス**: Render（本番環境）
- **データベース**: PostgreSQL
- **ローカル開発環境**: MySQL（開発・テスト用）

# ローカルでの動作方法
以下のコマンドを順に実行

%git clone https://github.com/3ttaka/dokoiku.git

%cd dokoiku

%bundle install

%yarn install

# 工夫したポイント
- SD法によって評価し、集まった評価の平均を出してお店の評価にする方法
- JavaScriptライブラリ「leaflet」による地図表示