# テーブル設計

## users テーブル
| Colum               | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| gender_id           | integer   | null: false |
| age_group_id        | integer   | null: false |
| profile             | text      |             |

### Association

- has_many :shops
- has_many :reviews
- has_many :comments

## shops テーブル
| Colum                 | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| shop_name             | string     | null: false                    |
| cuisine_type          | string     | null: false                    |
| closed_days           | string     | null: false                    |
| opening_hours         | string     | null: false                    |
| address               | string     | null: false                    |
| phone_number          | string     |                                |
| additional_info       | text       |                                |
| wifi                  | integer    | default: nil                   |
| smoking               | integer    | default: nil                   |
| payment_methods       | string     | array: true, default: []       |
| cleanliness_average   | float      | null: false, default: 0.0      |
| space_average         | float      | null: false, default: 0.0      |
| lighting_average      | float      | null: false, default: 0.0      |
| music_average         | float      | null: false, default: 0.0      |
| vibrancy_average      | float      | null: false, default: 0.0      |
| order_speed_average   | float      | null: false, default: 0.0      |
| service_style_average | float      | null: false, default: 0.0      |
| conversation_average  | float      | null: false, default: 0.0      |
| modal_price_range     | float      | null: false, default: 0.0      |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :reviews


## reviews テーブル
| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| cleanliness     | integer    | null: false, default: 0        |
| space           | integer    | null: false, default: 0        | 
| lighting        | integer    | null: false, default: 0        |
| music           | integer    | null: false, default: 0        |
| vibrancy        | integer    | null: false, default: 0        |
| order_speed     | integer    | null: false, default: 0        |
| service_style   | integer    | null: false, default: 0        |
| conversation    | integer    | null: false, default: 0        |
| price_range     | integer    | null: false, default: 0        |
| description     | text       |                                |
| user            | references | null: false, foreign_key: true |
| shop            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shop
- has_many   :comments

## commentsテーブル
| Colum     | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| review    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :review
