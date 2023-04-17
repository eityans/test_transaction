# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  code       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tickets_on_code  (code) UNIQUE
#
class Ticket < ApplicationRecord
  validates :code, presence: true, uniqueness: true
end
