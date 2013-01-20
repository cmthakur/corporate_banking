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
  belongs_to :account
  belongs_to :member

  after_create :update_account_balance

  def update_account_balance
    @balance = self.account.balance
    @balance.amount += self.amount.to_f
    @balance.save!
  end

  def collected_by
    Member.find(member_id).full_name
  end
end
