Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', action: :show, controller: 'healthcheck'
  get '/healthcheck', action: :show, controller: 'healthcheck'
  get '/sum/:par1/:par2', action: :sum, controller: 'sum'
end
