require 'rails_helper'

RSpec.describe "Shortener API", type: :request do
  let!(:urls) { create_list(:url, 120) }
  let!(:url) { create(:url, visits: 10, url: 'https://mauricioackermann.com.br')}

  describe "GET /top" do
    before { get '/top' }
    it 'returns top 100' do
      expect(json.size).to eq(100)
    end

    it 'get most visited first' do
      expect(json.first['url']).to eq('https://mauricioackermann.com.br')
    end
  end
  describe "POST /urls" do
    let(:attributes) { { url: 'https://google.com' } }

    context('when valid request') do
      before { post '/urls', params: attributes }

      it 'creates an url' do
        expect(json['url']).to match(/(http:\/\/www\.example.com\/)([[:alnum:]]){6}/)
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
        expect(response.body).to match(/Url can't be blank/)
      end
    end
  end
end
