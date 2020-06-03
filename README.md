# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# ChatSpace DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true, add_index: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|user_image|string|
|introduction|text|
|phone_number|integer|null: false,unique: true|
### Association
- has_many :products
- has_many :cards
- belongs_to :destination
- belongs_to :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|address|string|null: false|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false,unique: true|
|expriration_year|integer|null: false|
|expriration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destinations_first_name|string|null: false|
|destinations_family_name|string|null: false|
|birthdestinations_first_name_kana|string|null: false|
|destinations_family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|prefecture_code|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|phone_number|integer|null: false,unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false|
|introduction|text|null: false|
|consignor_area|string|null: false|
|price|integer|null: false|
|days|integer|null: false|
|condition|integer|null: false|
|size|string|null: false|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|image_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
### Association
- has_many :products

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :products
