# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  type       :string(255)      not null
#  profile_id :integer
#  status     :string(255)
#  balance_id :integer
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :balance_id, :email, :name, :profile_id, :status, :type
  has_one :profile
  has_one :balance
  has_many  :cash_collections
  self.inheritance_column = :_type_disabled
end
