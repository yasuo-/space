# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    # @user = User.from_omniauth(request.env["omniauth.auth"])

    # ユーザ登録まで自動的に実施せず、ユーザ検索のみ実施するように変更
    # メソッドはuser.rb側で定義します。
    @user = User.find_omniauth(request.env["omniauth.auth"])

    # if @user.persisted?
    # 新規ユーザの場合、この時点ではDBレコードが存在しないので以下に変更
    if @user
      sign_in_and_redirect @user # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      # Facebookから取得した情報をsessionに格納
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      # redirect_to new_user_registration_url

      # 新規ユーザの場合、`ユーザ名`登録用のテンプレートをrender
      @user = User.new
      render 'devise/registrations/after_omniauth_signup'
    end
  end

  def failure
    redirect_to root_path
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
