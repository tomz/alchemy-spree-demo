AlchemySpreeDemo::Application.routes.draw do
  mount Spree::Core::Engine, at: '/shop'
  mount Alchemy::Engine,     at: '/'
end
