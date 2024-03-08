#　テーブル設計

# usersテーブル
|Column             |Type      |Options                   |
|-------------------|----------|--------------------------|
|nickname           |string    |null: false               |
|email              |string    |null: false, unique: true |
|encrypted_password |string    |null: false               |
|last_name          |string    |null: false               |
|first_name         |string    |null: false               |
|last_name_kana     |string    |null: false               |
|first_name_kana    |string    |null: false               |

## Association
- has_many :items
- has_many :buys


# itemsテーブル
|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|name                |string     |null: false                     |
|comment             |text       |null: false                     |
|shipping_fee        |integer    |null: false                     |
|prefecture_id       |integer    |null: false                     |
|price               |integer    |null: false                     |
|shop                |references |null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :shop
- has_one :buy


# shopsテーブル
|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|shop_name           |string     |null: false                     |
|shop_name_kana      |string     |null: false                     |
|email               |string     |null: false, unique: true       |
|encrypted_password  |string     |null: false                     |
|last_name           |string     |null: false                     |
|first_name          |string     |null: false                     |
|last_name_kana      |string     |null: false                     |
|first_name_kana     |string     |null: false                     |
|prefecture_id       |integer    |null: false                     |

## Association
- hsa_many :items
- has_one :confirm


# buysテーブル
|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|user                  |references |null: false, foreign_key: true |
|item                  |references |null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :order


# ordersテーブル
|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|postcode              |string     |null: false                    |
|prefecture_id         |integer    |null: false                    |
|city                  |string     |null: false                    |
|block                 |string     |null: false                    |
|building              |string     |                               |
|phone                 |string     |null: false                    |
|buy                   |references |null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :confirm


# confirmsテーブル
|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|buy                   |references |null: false, foreign_key: true |
|order                 |references |null: false, foreign_key: true |

## Association
- belongs_to :shop
- has_many :buys
- has_many :orders
