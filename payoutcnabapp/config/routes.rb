Rails.application.routes.draw do
  get 'payments/index'

  get 'payments/show'

  get 'payments/create'

  get 'payments/update'

  get 'payments/destroy'

  get 'readfile/index'

  get 'readfile/show'

  get 'readfile/create'

  get 'readfile/update'

  get 'readfile/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'readfile#index'
end
