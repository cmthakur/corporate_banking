# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  fname             :string(255)      not null
#  mname             :string(255)
#  lname             :string(255)      not null
#  age               :integer          not null
#  father_name       :string(255)      not null
#  dob               :date             not null
#  district          :string(255)      not null
#  zone              :string(255)
#  ward_no           :integer
#  phone             :string(255)      not null
#  occupation        :string(255)
#  verification_id   :string(255)      not null
#  verification_type :string(255)
#  maritial_status   :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :integer
#  member_id         :integer
#  image             :string(255)
#  mcp               :string(255)
#

class Profile < ActiveRecord::Base
  attr_accessible :age, :district, :dob, :image, :mcp, :father_name, :fname, :lname, :maritial_status, :mname, :occupation, :phone, :verification_id, :verification_type, :ward_no, :zone, :account_id, :member_id
  belongs_to :account
  belongs_to :member

  VERIFIED_BY = [["Citizenship", 0],["Passport", 1],["Driving Liscence", 2]]
  MARITIAL_STATUS = [["Single", 0],["Marrried", 1]]
  mount_uploader :image, ImageUploader
end
