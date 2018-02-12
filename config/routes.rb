Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      resources :categories, only: %i[index create] do
        resources :products, only: %i[index create]
      end
      delete '/products/:id', to: 'products#destroy'
    end
  end
end
