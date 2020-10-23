class ProjectInviteMailer < ApplicationMailer
  def new_user_invite
    @invite = params[:invite]
    @url = params[:url]
    mail(to: @invite.email, subject: 'Hi! You have a new invitation to FollowUp')
  end

  def existing_user_invite
    @invite = params[:invite]
    @url = new_user_session_url
    mail(to: @invite.email, subject: 'You was invited to a new project')
  end
end
