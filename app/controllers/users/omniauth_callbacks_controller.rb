class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!, raise: false

  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])
    @token = session[:invite_token]

    if @user.persisted?
      @user.remember_me = true
      add_user_to_project
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.auth'] = request.env['omniauth.auth']
      render :edit
    end
  end

  # Method called after Twitter registration to update
  # missing personal information
  def sign_up_validation
    @user = User.from_omniauth(session['devise.auth'])

    if @user.update(user_params)
      add_user_to_project
      sign_in_and_redirect @user, event: :authentication
    else
      render :edit
    end
  end

  def failure
    redirect_to unauthenticated_root_url, error: 'Something was wrong, try again!' 
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :name)
  end

  def add_user_to_project
    return unless @token

    project =  Invite.find_by_token(@token).project
    resource.collaborations.push(project)
  end
end
