# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super

    session[:invite_token] = params[:invite_token]
  end

  def create
    super

    @token = session[:invite_token]
    return if @token.nil?

    project = Invite.find_by(token: @token).project
    resource.collaborations.push(project)
  end

  protected

  # This method allows to user update
  # the profile without password
  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params['password']&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except('current_password'))
  end
end
