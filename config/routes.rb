Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', action: :show, controller: 'healthcheck'
  get '/healthcheck', action: :show, controller: 'healthcheck'

  DECIMAL_PATTERN = /(\d{0,5})(?:\.\d{0,5})?/.freeze

  get '/sum/:value1/:value2/', action: :sum, controller: 'sum',
    :constraints => { :value1 => DECIMAL_PATTERN, :value2 => DECIMAL_PATTERN }
end
