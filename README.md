## Users table

|Column            |Type   |Options                  |
|nickname          |string |null: false, unique: true|
|email             |string |null: false, unique: true|
|password          |string |null: false, unique: true|
|last_name         |string |null: false              |
|first_name        |string |null: false              |
|ruby_last_name    |string |null: false              |
|ruby_first_name   |string |null: false              |
|birthday          |date   |null: false              |


### Association
has_many :items
has_many :orders


## Items table

|Column            |Type       |Options                       |
|name              |string     |null: false                   |
|detail            |string     |null: false                   |
|category          |string     |null: false                   |
|condition         |string     |null: false                   |
|delivery_free     |string     |null: false                   |
|shipping_area     |string     |null: false                   |
|shipping_days     |string     |null: false                   |
|price             |string     |null: false                   |
|user_id           |references |null: false, foreign_key:true |


### Association
belongs_to :user
has_one :order


## Orders table

|Column            |Type       |Options                       |
|user_id           |references |null: false, foreign_key:true |
|item_id           |references |null: false, foreign_key:true |


### Association
belongs_to :user
belongs_to :item
has_one :ship_address


## Ship_addresses table

|Column            |Type       |Options                       |
|postal_code       |string     |null: false                   |
|prefectures       |string     |null: false                   |
|city              |string     |null: false                   |
|address_detail    |string     |null: false                   |
|apartment         |string     |null: false                   |
|phone_number      |string     |null: false                   |
|user_id           |references |null: false, foreign_key:true |


### Association
belongs_to :order