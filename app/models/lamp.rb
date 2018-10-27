require 'resolv'

class Lamp < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :ip_address, presence: true, uniqueness: true, format: { with: Resolv::AddressRegex }
end
