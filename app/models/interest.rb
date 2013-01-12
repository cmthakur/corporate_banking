# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ActiveRecord::Base
  attr_accessible :id, :type, :value
end
