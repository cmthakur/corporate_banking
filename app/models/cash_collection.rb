# == Schema Information
#
# Table name: cash_collections
#
#  id         :integer          not null, primary key
#  account_id :integer          not null
#  amount     :float            default(0.0)
#  member_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CashCollection < ActiveRecord::Base
  attr_accessible :account_id, :amount, :id, :member_id
end
