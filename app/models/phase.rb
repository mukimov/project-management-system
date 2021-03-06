class Phase < ActiveRecord::Base
  belongs_to :project
  acts_as_list :scope => :project
  has_many :activities, :dependent => :destroy
  has_many :milestones, :dependent => :destroy
  has_one :event, :as => :eventable, :dependent => :destroy
  has_one :document, :as => :documentable, :dependent => :destroy
  has_many :attachments, :dependent => :destroy, :as => :attachable
  accepts_nested_attributes_for :event
  accepts_nested_attributes_for :attachments
  validates_presence_of :title, :project, :event

  def activities_done
    activities.where(:done => true)
  end

  def activities_in_progress
    activities.where(:done => false)
  end

  after_create :create_document
  after_create :set_document

  def set_document
    self.document.project = self.project
    self.document.pad_id = SecureRandom.hex
    self.document.save!
  end

  def complete
    if activities_done.size > 0 && activities.size > 0
      ((activities_done.size.to_f / activities.size.to_f) * 100).to_i
    else
      0
    end
  end
end
# == Schema Information
#
# Table name: phases
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  complete   :boolean         default(FALSE)
#

