# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  user_name              :string(255)
#  type                   :string(255)
#  profile_id             :integer
#  status                 :string(255)      default("joined")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

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
class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable#,:registerable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :user_name, :profile_id, :status, :type
  has_one :profile
  has_many :cash_collections
  self.inheritance_column = :_type_disabled

  ROLES = [["Super Admin", 0],["Finance Admin", 1],["Loan Admin",2],["Collection Admin",3],["Normal Staff",4]]

  def full_name
    @profile = self.profile
    if @profile
      @fullname = "#{@profile.fname} #{@profile.mname} #{@profile.lname}"
    end
    full_name = @fullname ? @fullname : self.user_name
  end

  def is_super_admin?
    type == "0"
  end

  def is_finance_admin?
    type == "1"
  end

  def is_loan_admin?
    type == "2"
  end

  def is_collection_admin?
    type == "3"
  end

  def is_collection_staff?
    type == "4"
  end
end
