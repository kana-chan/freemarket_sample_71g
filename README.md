# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
sample_71g  DB設計
## adminsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|money_id|references|foreign_key: true|
|like_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|comment_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
|image_id|references|foreign_key: true|
### Association
- has_many :items
- has_many :users
- has_many :moneys
- has_many :likes
- has_many :brands
- has_many :comments
- has_many :categories
- has_many :addresses
- has_many :images

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|
|name|string|null: false|
|explaination|string|null: false|
|condition|string|null: false|
|date|integer|null: false|
|shipping-method|string|null: false|
|cost|integer|null: false|
|money_id|references|foreign_key: true|
|comment_id|references|foreign_key: true|
|user_id|references|foreign_key: true|
|like_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
### Association
- belongs_to :money
- belongs_to :user
- has_many :comments
- has_many :likes
- has_many  :cotegories, through: :items_categories
- has_many  :items_categories

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false, unique: true|
|address|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile|string|null: false|
|assessment|string|null: false|
|phone-number|interger|null: false|
|gender|string|null: false|
|payment-method|string|null: false|
|image|string|null: false|
|favorite|string||
|item_id|references|foreign_key: true|
|comment_id|references|foreign_key: true|
|like_id|references|foreign_key: true|
|money_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
### Association
- has_many :items
- has_many  :comments
- has_many  :likes
- has_many  :cards
- belongs_to  :address

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip|integer|null: false|
|address|string|null: false|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :user
- has_many :items

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|references|foreign_key: true|
|card_id|references|foreign_key: true|
|user|references|foreign_key: true|
### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|references|foreign_key: true|
### Association
belongs_to :parent, class_name: :Categories
has_many :children,class_name: :Categories,foreign_key: :parent_id


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|item_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|item_id|references|foreign_key: true|
### Association
- belongs_to :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|foreign_key: true|
### Association
- belongs_to :item

## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
### Association
- belongs_to :item
- belongs_to :category

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
