class SuggestionsController < ApplicationController
  def new
  end

  def create
    if verify_hcaptcha
      # Your existing code to handle form submission
    else
      flash[:alert] = "hCaptcha verification failed, please try again."
      render :new
    end
  end
end
