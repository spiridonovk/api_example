
require 'rails_helper'

describe Api::V1::CategoriesController, type: :request do
  describe 'GET #index' do
    let!(:category) { create :category }
    before { get '/api/v1/categories' }

    it 'return code 200' do
      expect(response).to have_http_status(200)
    end
    it 'response type is json' do
      expect(response.content_type).to eq('application/json')
    end
    it 'content' do
      expect(response.body).to eq([{
        id: category.id,
        name: category.name,
        products_count: category.products_count
      }].to_json)
    end
  end
  describe ' POST #create' do
    context 'when success' do
      before { post '/api/v1/categories', params: { category: { name: 'Candy' } } }

      it 'return code 201' do
        expect(response).to have_http_status(201)
      end
      it 'response type is json' do
        expect(response.content_type).to eq('application/json')
      end
      it 'content' do
        expect(response.body).to eq({
          id: Category.last.id,
          name: 'Candy',
          products_count: 0
        }.to_json)
      end
    end
    context 'The name alredy exist' do
      let!(:category) { create :category }
      before { post '/api/v1/categories', params: { category: { name: 'Candy' } } }

      it 'return code 422' do
        expect(response).to have_http_status(422)
      end
      it 'response include text' do
        expect(response.body).to include('has already been taken')
      end
    end
  end
end
