class Word < ApplicationRecord
  # Validations
  validates_presence_of :word, :appearance
end
