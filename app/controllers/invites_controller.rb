# frozen_string_literal: true

class InvitesController < ApplicationController
  before_action :project, only: :create

  def create
    emails = invite_params[:emails].split(', ')
    emails.each do |email|
      @invite = @project.invites.new(email: email)
      @invite.sender = current_user

      send_invite_mail(@invite) if @invite.save
    end

    redirect_to @project, notice: 'Invitations were sent successfully'
  end

  private

  def project
    @project ||= current_user.projects.friendly.find(params[:project_id])
  end

  def invite_params
    params.require(:invite).permit(:emails)
  end

  def send_invite_mail(invite)
    if invite.recipient
      ProjectInviteMailer.with(invite: invite).existing_user_invite.deliver_later
      invite.recipient.collaborations.push(invite.project)
    else
      ProjectInviteMailer
        .with(invite: invite,
              url: new_user_registration_url(invite_token: invite.token))
        .new_user_invite
        .deliver_later
    end
  end
end
