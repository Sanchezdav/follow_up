# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/project_invite_mailer
class ProjectInviteMailerPreview < ActionMailer::Preview
  def new_user_invite
    invite = Invite.create(
      project: Project.first,
      sender: User.first,
      recipient: nil,
      email: 'spiderman@gmail.com',
      token: 'uber123'
    )
    ProjectInviteMailer.with(invite: invite).new_user_invite
  end

  def existing_user_invite
    invite = Invite.create(
      project: Project.first,
      sender: User.first,
      recipient: User.last,
      email: User.last.email,
      token: 'uber12345'
    )
    ProjectInviteMailer.with(invite: invite).existing_user_invite
  end
end
