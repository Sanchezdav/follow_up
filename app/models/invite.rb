# == Schema Information
#
# Table name: invites
#
#  id           :bigint           not null, primary key
#  email        :string
#  token        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :bigint           not null
#  recipient_id :integer
#  sender_id    :integer          not null
#
# Indexes
#
#  index_invites_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Invite < ApplicationRecord
  belongs_to :project
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  before_create :generate_token
  before_save :check_if_user_exists

  validates :email, presence: true

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.project_id, Time.current].join)
  end

  def check_if_user_exists
    recipient = User.find_by_email(email)
    return unless recipient

    self.recipient_id = recipient.id
  end
end
