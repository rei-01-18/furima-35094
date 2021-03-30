## users テーブル

| Column             |  Type     |   Options                  |
| ------------------ | --------- | -------------------------- |
| nickname           | string    | null: false                |
| email              | string    | null: false, unique: true  |
| encrypted_password | string    | null: false                |
| first_name         | string    | null: false                |
| last_name          | string    | null: false                |
| first_name_furigana| string    | null: false                |
| last_name_furigana | string    | null: false                |
| birth_day          | date      | null: false                |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              |  Type     |   Options                     |
| ------------------- | --------- | ----------------------------- |
| product_name        | string    | null: false                   |
| product_description | text      | null: false                   |
| price               | integer   | null: false                   |
| category_id         | integer   | null: false                   |
| product_status_id    | integer   | null: false                   |
| prefecture_id       | integer   | null: false                   |
| shipping_day_id     | integer   | null: false                   |
| shipping_charge_id  | integer   | null: false                   |
| user                | references| null: false, foreign_key:true |

### Association

- has_one    :purchase
- belongs_to :user 

## purchases

| Column              |  Type      |   Options                     |
| ------------------- | ---------- | ----------------------------- |
| user                | references | null: false, foreign_key:true |
| item                | references | null: false, foreign_key:true |

### Association

- has_one     :shipping_address
- belongs_to  :user
- belongs_to  :item

## shipping＿addresses

| Column              |  Type     |   Options                   |
| ------------------- | --------- | --------------------------- |
| postal_code         | string    | null: false                 |
| prefecture_id       | integer   | null: false                 |
| municipality      | string    | null: false                 |
| address             | string    | null: false                 |
| building_name       | string    |                             |
| phone_number        | string    | null: false                 |
| purchase            | references| null: false, foreign_key:true|

### Association

- belongs_to :purchase
