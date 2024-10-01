class SuggestionsController < ApplicationController
  def new
  end

  def create
    captcha_validated, captcha_response = verify_hcaptcha
    if captcha_validated
      puts("Captcha validated")
    else
      flash[:error] = captcha_response[:error_codes]
      render :new
    end
  end
end
