Rails.application.routes.draw do

  resources :arquivos, only: [:index, :new, :create, :destroy]

  get 'arquivos/index'

  get 'arquivos/new'

  get 'arquivos/create'

  get 'arquivos/destroy'

  get 'payments/index'

  get 'payments/show'

  get 'payments/create'

  get 'payments/update'

  get 'payments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'payments#show'
end
