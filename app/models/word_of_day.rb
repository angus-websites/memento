class WordOfDay < ApplicationRecord

  def formatted_date
    date.strftime("%d %B %Y") # e.g., "09 September 2024"
  end

  def english_date
    # 09/08/2024
    date.strftime("%d/%m/%Y")
  end

end
