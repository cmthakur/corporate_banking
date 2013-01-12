# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  type       :string(255)      not null
#  profile_id :integer          not null
#  status     :string(255)      not null
#  balance_id :integer          not null
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  attr_accessible :balance_id, :email, :name, :profile_id, :status, :type
end
