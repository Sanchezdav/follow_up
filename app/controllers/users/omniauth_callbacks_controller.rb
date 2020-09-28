class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!, raise: false

  def twitter
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      @user.remember_me = true
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.auth"] = request.env["omniauth.auth"]
      render :edit
    end
  end

  # Method called after Facebook registration
  def sign_up_validation
    @user = User.from_omniauth(session["devise.auth"])

    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentication
    else
      render :edit
    end
  end

  def failure
    redirect_to unauthenticated_root_url, error: "Something was wrong, try again!" 
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :name)
  end
end
