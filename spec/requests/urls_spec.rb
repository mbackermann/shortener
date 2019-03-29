require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "POST /urls" do
    let(:attributes) { { current_url: 'https://google.com' } }

    context('when valid request') do
      before { post '/urls', params: attributes }

      it 'creates an url' do
        expect(json['url']).to eq('http://www.example.com/99999e')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context('when the request is invalid') do
      before { post '/urls' }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message'do
        expect(response.body).to match(/Current url can't be blank/)
      end
    end
  end
end
