## usersテーブル
|Column            |Type     |Options    |
|----------------- |---------|-----------|
|nickname          |string   |null: false|
|email             |string   |null: false,unique: true|
|encrypted_password|string   |null: false|
|family_name       |string   |null: false|
|first_name        |string   |null: false|
|family_nameKana   |string   |null: false|
|first_nameKana    |string   |null: false|
|birthday          |date     |null: false|
### Association
- has_many :items
- has_many :comments
- has_many :purchases

## itemsテーブル
|Column              |Type     |Options    |
|------------------  |---------|-----------|
|name                |string   |null: false|
|explanation         |text     |null: false|
|category_id         |integer  |null: false|
|status_id           |integer  |null: false|
|shipping_charge_id  |integer  |null: false|
|dispatch_area_id    |integer  |null: false|
|shipping_duration_id|integer  |null: false|
|price               |integer  |null: false|
|user                |reference|foreign_key: true|
### Association
- belongs_to :user
- has_many   :comments
- has_one    :purchase

## addressesテーブル
|Column            |Type     |Options    |
|------------------|---------|-----------|
|zip_number        |string   |null: false|
|dispatch_area_id  |integer  |null: false|
|city              |string   |null: false|
|block_number      |string   |null: false|
|building_name     |string   |           |
|phone_number      |string   |null: false|
|purchases         |reference|foreign_key: true|
### Association
- belongs_to :purchase

## commentsテーブル
|Column   |Type     |Options    |
|------   |---------|-----------|
|text     |text     |null: false|
|user     |reference|foreign_key: true|
|item     |reference|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## purchasesテーブル
|Column      |Type     |Options    |
|------------|---------|-----------|
|user_id     |integer  |null: false|
|item_id     |integer  |null: false|
### Association
- belongs_to :user
- belongs_to :item
- has_one    :address