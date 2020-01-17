class Base < ApplicationRecord
  validates :base_name, presence: true, length: { maximum: 20 }
  validates :base_type, presence: true, length: { maximum: 20 }
end
