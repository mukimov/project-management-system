require 'spec_helper'

describe Activity do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: activities
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  phase_id    :integer
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  status_id   :integer
#  priority_id :integer
#  file        :string(255)
#  member_id   :integer
#  done        :boolean         default(FALSE)
#

