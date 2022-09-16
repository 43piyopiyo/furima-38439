## Users table

|Column              |Type   |Options                  |
|nickname            |string |null: false              |
|email               |string |null: false, unique: true|
|encrypted_password  |string |null: false              |
|last_name           |string |null: false              |
|first_name          |string |null: false              |
|ruby_last_name      |string |null: false              |
|ruby_first_name     |string |null: false              |
|birthday            |date   |null: false              |


### Association
has_many :items
has_many :orders


## Items table

|Column            |Type       |Options                       |
|name_id           |integer    |null: false                   |
|detail_id         |integer    |null: false                   |
|category_id       |integer    |null: false                   |
|condition         |string     |null: false                   |
|delivery_free     |string     |null: false                   |
|prefecture_id     |integer    |null: false                   |
|shipping_days     |string     |null: false                   |
|price             |integer    |null: false                   |
|user              |references |null: false, foreign_key:true |


### Association
belongs_to :user
has_one :order


## Orders table

|Column            |Type       |Options                       |
|user              |references |null: false, foreign_key:true |
|item              |references |null: false, foreign_key:true |


### Association
belongs_to :user
belongs_to :item
has_one :ship_address


## Ship_addresses table

|Column            |Type       |Options                       |
|postal_code       |string     |null: false                   |
|prefecture_id     |integer    |null: false                   |
|city              |string     |null: false                   |
|address_detail    |string     |null: false                   |
|apartment         |string     |                              |
|phone_number      |string     |null: false                   |
|user              |references |null: false, foreign_key:true |


### Association
belongs_to :order