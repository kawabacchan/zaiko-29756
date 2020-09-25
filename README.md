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

has_many :delivery_dates
has_many :shops, through: delivery_dates
has_many :orders


## companysテーブル

| Column        | type    | option      |
| ------------- | ------- | ----------- |
| name          | string  | null: false |

### Association

has_many :shops


## shopsテーブル

| Column        | type       | option      |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| code          | string     | null: false |
| prefecture_id | integer    | null: false |
| delibery_days | integer    | null: false |
| company       | references | null: false |

### Association

belongs_to :company
has_many :delivery_dates
has_many :items, through: delivery_dates
has_many :orders


## delivery_datesテーブル

| Column        | type        | option      |
| ------------- | ----------- | ----------- |
| item          | references  | null: false |
| shop          | references  | null: false |

### Association

belongs_to :item
belongs_to :shop


## ordersテーブル

| Column        | type        | option      |
| ------------- | ----------- | ----------- |
| sales_numbers | integer     | null: false |
| item          | references  | null: false |
| shop          | references  | null: false |

### Association

belongs_to :item
belongs_to :shop