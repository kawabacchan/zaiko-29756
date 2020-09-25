class DeliveryDate < ApplicationRecord

  belongs_to :item
  belongs_to :shop

end
