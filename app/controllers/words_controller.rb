class WordsController < ApplicationController
  before_action :set_word, only: [:show, :create]

  # POST /words
  def create
    unless @word
      @word = Word.create!(
        word: word_params[:word],
        appearance: 1
      )

      json_response(@word, :created)
    else
      @word.appearance += 1
      @word.save!

      json_response(@word)
    end
  end

  # GET /words/:word
  def show
    unless @word
      json_response({ message: "Word: #{word_params[:word]} not found" }, :not_found)
    else
      json_response(@word)
    end
  end

  private

  def word_params
    params.permit(:word, :appearance)
  end

  def set_word
    @word = Word.find_by(word: params[:word])
  end
end
