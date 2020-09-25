# テーブル設計

## itemsテーブル

| Column        | type    | option      |
| ------------- | ------- | ----------- |
| category_id   | integer | null: false |
| code          | string  | null: false |
| name          | string  | null: false |
| stock         | integer | null: false |
| monthly_sales | integer | null: false |
| creation_days | integer | null: false |

### Association

has_many: delivery_dates
has_many: shops, through: delivery_dates
has_many: orders

## shopsテーブル

| Column        | type    | option      |
| ------------- | ------- | ----------- |
| campany_name  | string  | null: false |
| shop_name     | string  | null: false |
| prefecture_id | integer | null: false |
| delibery_days | integer | null: false |

### Association

has_many: delivery_dates
has_many: items, through: delivery_dates
has_many: orders

## delivery_datesテーブル

| Column        | type        | option      |
| ------------- | ----------- | ----------- |
| item          | references  | null: false |
| shop          | references  | null: false |

### Association

belongs_to: item
belongs_to: shop

## delivery_datesテーブル

| Column        | type        | option      |
| ------------- | ----------- | ----------- |
| sales_numbers | integer     | null: false |
| item          | references  | null: false |
| shop          | references  | null: false |

### Association

belongs_to: item
belongs_to: shop