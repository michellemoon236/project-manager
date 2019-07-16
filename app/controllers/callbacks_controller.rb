class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end

  # def sign_in_with(provider_name)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   sign_in_and_redirect @user, :event => :authentication
  # end

  # def github
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   sign_in_with "Github"
  # end
end
