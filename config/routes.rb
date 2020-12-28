Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
		resources :pokemons, only: :index
		resources :players, only: [:index, :create]
  	end
  end
end
