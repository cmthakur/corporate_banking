# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  type       :string(255)      not null
#  profile_id :integer
#  status     :string(255)      default("joined")
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
  attr_accessible :email, :name, :profile_id, :status, :type
  has_one :profile
  has_many :cash_collections
  self.inheritance_column = :_type_disabled

  ROLES = [["Super Admin", 0],["Finance Admin", 1],["Collection Admin",2],["Loan Admin",2],["Normal Staff",2]]

  def full_name
    @profile = self.profile
    if @profile
      @fullname = "#{@profile.fname} #{@profile.mname} #{@profile.lname}"
    end
    full_name = @fullname ? @fullname : self.name
  end
end
