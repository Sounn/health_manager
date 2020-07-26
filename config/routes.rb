Rails.application.routes.draw do
  root to: "bodies#index"
  devise_for :users
  scope :bodies do
    get 'index', to:'bodies#index', as:'bodies_index'
    get 'new', to:'bodies#new',as:'bodies_new'
    post 'create', to:'bodies#create',as:'bodies_create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #メール確認用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
