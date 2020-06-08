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


# fleamarket_sample_76e DB設計
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
|address_id|references|null: false, foreign_key: true|
|mypage_id|references|null: false, foreign_key: true|
|phone_number|integer|null: false,unique: true|
### Association
- has_many :items
- has_many :cards
- belongs_to :seller
- belongs_to :buyer
- belongs_to :mypage
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
- belongs_to :seller
- belongs_to :buyer

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|references|null: false, foreign_key: true|
|customer_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## sellersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|address_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :address

## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|address_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :address

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|introduction|text|null: false|
|consignor_area|string|null: false|
|price|integer|null: false|
|days|integer|null: false|
|delivery_fee|integer|null: false|
|condition|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
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
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|add_index: true|
### Association
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
