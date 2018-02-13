
require 'rails_helper'

describe Api::V1::ProductsController, type: :request do
  let!(:category) { create :category }

  describe 'GET #index' do
    let!(:product) { create :product, category_id: category.id }

    context 'when success' do
      before { get "/api/v1/categories/#{category.id}/products" }

      it 'return code 200' do
        expect(response).to have_http_status(200)
      end
      it 'response type is json' do
        expect(response.content_type).to eq('application/json')
      end
      it 'content' do
        expect(response.body).to eq([{
          id: product.id,
          name: product.name,
          price: product.price
        }].to_json)
      end
    end
  end
  describe ' POST #create' do
    context 'when success' do
      before { post "/api/v1/categories/#{category.id}/products", params: { product: { name: 'Butter', price: 2.6 } } }

      it 'return code 201' do
        expect(response).to have_http_status(201)
      end
      it 'response type is json' do
        expect(response.content_type).to eq('application/json')
      end
      it 'content' do
        expect(response.body).to eq({
          id: Product.last.id,
          name: 'Butter',
          price: 2.6
        }.to_json)
      end
      it 'change products_count' do
        expect(Category.first.products_count).to eq(category.products_count + 1)
      end
    end

    context 'The name alredy exist' do
      let!(:product) { create :product, name: 'Butter', category_id: category.id }

      before { post "/api/v1/categories/#{category.id}/products", params: { product: { name: 'Butter', price: 2.6 } } }

      it 'return code 422' do
        expect(response).to have_http_status(422)
      end
      it 'response include text' do
        expect(response.body).to include('has already been taken')
      end
    end
    context 'The price is 0' do
      before { post "/api/v1/categories/#{category.id}/products", params: { product: { name: 'Butter', price: 0 } } }

      it 'return code 422' do
        expect(response).to have_http_status(422)
      end
      it 'response type is json' do
        expect(response.content_type).to eq('application/json')
      end
      it 'response include text' do
        expect(response.body).to include('must be greater than 0')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create :product, name: 'Butter', category_id: category.id }

    before { delete "/api/v1/products/#{product.id}" }
    it 'return code 204' do
      expect(response).to have_http_status(204)
    end

    it 'content is nil' do
      expect(response.body).nil?
    end

    # let! increase by 1, delete decrease by 1
    it 'change products_count' do
      expect(Category.first.products_count).to eq(category.products_count)
    end
  end
end
