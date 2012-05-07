class Member < ActiveRecord::Base
  belongs_to :user
  #belongs_to :principal, :foreign_key => 'user_id'
  belongs_to :project
  has_many :member_roles, :dependent => :destroy
  has_many :roles, :through => :member_roles

  #validates_presence_of :principal, :project
  validates_presence_of :project
  validates_uniqueness_of :user_id, :scope => :project_id
end
# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
