## usersテーブル
|Column           |Type     |Options    |
|-----------------|---------|-----------|
|nickname         |string   |null: false|
|email            |string   |null: false|
|password         |string   |null: false|
|familyName       |string   |null: false|
|firstName        |string   |null: false|
|familyNameKana   |string   |null: false|
|firstNameKana    |string   |null: false|
|birthYear        |integer  |null: false|
|birthMonth       |integer  |null: false|
|birthDay         |integer  |null: false|
### Association
- has_many :items
- has_one  :transactions
- has_many :comments

## itemsテーブル
|Column            |Type     |Options    |
|------------------|---------|-----------|
|image             |         |           |
|name              |text     |null: false|
|explanation       |text     |null: false|
|category          |string   |null: false|
|Status            |string   |null: false|
|shippingCharge    |string   |null: false|
|dispatchArea      |string   |null: false|
|shippingDuration  |integer  |null: false|
|price             |integer  |null : true|
|user              |reference|           |
|transaction       |reference|           |
### Association
- belongs_to :user
- has_many   :comments
- has_one    :transactions

## transactionsテーブル
|Column            |Type     |Options    |
|------------------|---------|-----------|
|creditCardNumber  |integer  |null: false|
|expireMonth       |integer  |null: false|
|expireYear        |integer  |null: false|
|securityCode      |integer  |null: false|
|zipNumber         |integer  |null: false|
|prefecture        |text     |null: false|
|city              |text     |null: false|
|blockNumber       |text     |null: false|
|buildingName      |text     |null : true|
|user              |reference|           |
|item              |reference|           |
### Association
- belongs_to :user
- belongs_to :transactions

## commentsテーブル
|Column   |Type     |Options    |
|------   |---------|-----------|
|text     |text     |null: false|
|user     |reference|           |
|item     |reference|           |
### Association
- belongs_to :users
- belongs_to :items
