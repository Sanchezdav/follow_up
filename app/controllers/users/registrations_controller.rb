class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super

    session[:invite_token] = params[:invite_token]
  end

  def create
    super

    @token = session[:invite_token]
    unless @token.nil?
      project =  Invite.find_by_token(@token).project
      resource.collaborations.push(project)
    end
  end
end
