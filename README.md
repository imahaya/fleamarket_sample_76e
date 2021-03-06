# README

# アプリケーション名
フリマ

# アプリケーション概要
フリマアプリのクローンサイト。5人のチームでアジャイル開発を行いました。
誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

# 機能一覧
●haml/SASS記法と、命名規則BEMを使ったマークアップ

●ユーザー登録、ログイン機能

●カテゴリー機能(ancestry)

●商品出品機能

●商品購入機能

●クレジットカード登録機能(PayJP)

●ajaxを使用した非同期処理

# 使用技術
## ●データベース
MySQL 5.6.47

## ●インフラ
AWS EC2

AWS S3

## デプロイ
Capistranoによる自動デプロイ


# fleamarket_sample_76e DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, default: "", unique: true, add_index: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|user_image|text|
|introduction|text|
|address|references|
|phone_number|integer|null: false, unique: true, limit: 8|
|encrypted_password|string|null: false, default: ""|
### Association
- has_many :items
- has_many :cards
- has_many :sellers
- has_many :buyers
- has_one :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|shopping_family_name|string|null: false|
|shopping_first_name|string|null: false|
|shopping_family_name_kana|string|null: false|
|shopping_first_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|buildingname|string|
|phone_number|integer|limit: 8|
|user|references|foreign_key: true|
### Association
- belongs_to_active_hash :prefecture
- belongs_to :user
- belongs_to :seller
- belongs_to :buyer

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|card_id|string|null: false|
|customer_id|string|null: false|
### Association
- belongs_to :user

## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|address|references|null: false|
### Association
- belongs_to :user
- has_many :addresses

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|address|references|null: false|
### Association
- belongs_to :user
- has_many :addresses

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|introduction|text|null: false|
|prefecture_id|integer|null: false|
|price|integer|null: false|
|day|integer|null: false, default: 0|
|delivery_fee|integer|null: false, default: 0|
|condition|integer|null: false, default: 0|
|category_id|integer|null: false, foreign_key: true|
|user|references|
|purchaser_id|integer|
|brand|string|
|trading|string|default: '出品中'|
### Association
- belongs_to_active_hash :prefecture
- belongs_to :user
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
