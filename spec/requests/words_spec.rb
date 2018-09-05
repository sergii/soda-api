require 'rails_helper'

RSpec.describe 'Words API', type: :request do

  let!(:words) { create_list(:word, 2) }
  let(:word) { words.first.word }

  describe 'GET /words/:word' do
    before { get "/words/#{word}" }

    context 'when the record exists' do
      it 'returns the word' do
        expect(json).not_to be_empty
        expect(json['word']).to eq(word)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:word) { 'nonexistent_word' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Word: #{word} not found/)
      end
    end
  end

  describe 'POST /words' do

    let(:valid_attributes) { { word: 'Hello', appearance: '1' } }

    context 'when the request is valid' do
      context 'and we haven\'t word in our DB' do
        before { post '/words', params: valid_attributes }

        it 'creates a word' do
          expect(json['word']).to eq('Hello')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end
    end

    context 'when the request is invalid' do
      # Here we can later describe the cases when the user tries to submit
      # wrong data type, f.e. binary etc
    end
  end
end
