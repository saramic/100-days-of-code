class HomeController < ApplicationController
  def setup_2fa
    current_user.otp_required_for_login = true
    current_user.otp_secret = User.generate_otp_secret
    current_user.save!
    @otp_secret = current_user.otp_secret
    render action: :index
  end
end
