class PagesController < ApplicationController
  include AuthJwt
  def index
  end

  def show
    passed_token = request.authorization
    # decoded_token = FirebaseAuth::Auth.verify_id_token(passed_token)
  rescue => e
    # error handling
  end

  def callback
    passed_token = request.authorization
    decoded_token = AuthJwt::Firebase.verify_id_token(passed_token)
    p decoded_token
  rescue => exception
    p exception
  end
end
