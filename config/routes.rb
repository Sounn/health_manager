Rails.application.routes.draw do
  root to: "bodies#index"
  devise_for :users
  scope :bodies do
    get 'index', to:'bodies#index', as:'bodies_index'
    get 'new', to:'bodies#new', as:'bodies_new'
    post 'create', to:'bodies#create',as:'bodies_create'
    get ':id/edit', to:'bodies#edit', as:'bodies_edit'
    patch ':id/update', to:'bodies#update',as:'bodies_update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #開発環境のみ
  if Rails.env.development?
    #メール確認用
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
