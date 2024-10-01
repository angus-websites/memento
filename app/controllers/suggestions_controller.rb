class SuggestionsController < ApplicationController
  def new
  end

  def create
    captcha_validated, captcha_response = verify_hcaptcha
    if captcha_validated
      @suggestion = Suggestion.new(suggestion_params)
      if @suggestion.save
        flash[:notice] = "Suggestion submitted successfully."
        redirect_to suggestions_new_path
      else
        flash[:error] = @suggestion.errors.full_messages.join(", ")
        render :new
      end
    else
      flash[:error] = captcha_response[:error_codes]
      render :new
    end
  end

  private

  def suggestion_params
    # Validates the parameters passed to the create action, ensures the data comes
    # nested under the suggestion key, and permits only the specified attributes.
    params.require(:suggestion).permit(:word, :definition, :phonetic, :example)
  end
end
