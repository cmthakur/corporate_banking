# == Schema Information
#
# Table name: balances
#
#  id          :integer          not null, primary key
#  amount      :float            default(0.0)
#  member_id   :integer          not null
#  interest_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Balance < ActiveRecord::Base
  attr_accessible :amount, :interest_id, :member_id
  belongs_to :member
  has_one :interest
end
