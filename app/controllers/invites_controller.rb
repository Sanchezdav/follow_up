class InvitesController < ApplicationController
  before_action :set_project, only: :create

  def create
    @invite = @project.invites.new(invite_params)
    @invite.sender = current_user

    if @invite.save
      if @invite.recipient
        ProjectInviteMailer.with(invite: @invite).existing_user_invite.deliver_later
        @invite.recipient.collaborations.push(@invite.project)
        redirect_to @project, notice: "#{@invite.recipient.email} was added to the project."
      else
        ProjectInviteMailer
          .with(
            invite: @invite,
            url: new_user_registration_url(invite_token: @invite.token)
          )
          .new_user_invite
          .deliver_later
        redirect_to @project, notice: "#{@invite.email} was invited to the project."
      end
    end
  end

  private

  def set_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def invite_params
    params.require(:invite).permit(:email)
  end
end
