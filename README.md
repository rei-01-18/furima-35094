## users テーブル

| Column             |  Type     |   Options     |
| ------------------ | --------- | ------------- |
| nickname           | string    | null: false   |
| email              | string    | null: false   |
| encrypted_password | string    | null: false   |
| first_name         | string    | null: false   |
| last_name          | string    | null: false   |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              |  Type     |   Options     |
| ------------------- | --------- | ------------- |
| product_name        | string    | null: false   |
| product_description | text      | null: false   |
| price               | integer   | null: false   |
| category_id         | integer   | null: false   |
| product_status_id   | integer   | null: false   |
| shipping_area_id    | integer   | null: false   |
| shipping_days_id    | integer   | null: false   |
| shipping_charges_id | integer   | null: false   |

### Association

- has_one    :purchase
- belongs_to :user

## purchase

| Column              |  Type    |   Options     |
| ------------------- | -------- | ------------- |
| user_id             | string   | null: false   |
| item_id             | string   | null: false   |

### Association

- has_one     :shipping_address
- belongs_to  :user
- belongs_to  :item

## shipping＿address

| Column              |  Type     |   Options     |
| ------------------- | --------- | ------------- |
| postal_code         | string    | null: false   |
| prefectures         | integer   | null: false   |
| municipalities      | string    | null: false   |
| address             | string    | null: false   |
| building_name       | string    |               |
| phone_number        | string    | null: false   |

### Association

- belongs_to :purchase
