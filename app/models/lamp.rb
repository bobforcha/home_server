class Lamp < ApplicationRecord
  validates :name, presence: true
  validates :ip_address, presence: true
end
