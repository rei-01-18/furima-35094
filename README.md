## users テーブル

| Column      |  Type     |   Options     |
| ----------- | --------- | ------------- |
| nickname    | string    | null: false   |
| email       | string    | null: false   |
| password    | string    | null: false   |
| first_name  | string    |  null: false  |
| last_name   | string    | null: false   |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              |  Type     |   Options     |
| ------------------- | --------- | ------------- |
| image               |           | ActiveStorage |
| product_name        | string    | null: false   |
| product_description | text      | null: false   |
| price               | string    | null: false   |
| category            |           |  ActiveHash   |
| product status      |           |  ActiveHash   |
| shipping area       |           |  ActiveHash   |
| shipping days       |           |  ActiveHash   |
| shipping charges    |           |  ActiveHash   |

### Association

- has_one    :purchase
- belongs_to :user

## purchase

| Column              |  Type    |   Options     |
| ------------------- | -------- | ------------- |
| card information    | string   | null: false   |
| expiration date     | string   | null: false   |
| security code       | string   | null: false   |

### Association

- has_one     :shipping address
- belongs_to  :user
- belongs_to  :item

## shipping address

| Column              |  Type     |   Options     |
| ------------------- | --------- | ------------- |
| postal code         | string    | null: false   |
| prefectures         |           | ActiveHash    |
| municipalities      | string    | null: false   |
| address             | string    | null: false   |
| building name       | string    |               |
| phone number        | string    | null: false   |

### Association

- belongs_to :purchase
