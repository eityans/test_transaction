class Ticket < ApplicationRecord
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
end
