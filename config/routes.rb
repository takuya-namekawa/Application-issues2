Rails.application.routes.draw do
  get 'chats/show'
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :notifications, only: :index
  resources :chats, only: [:create]

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
   
  end
  resources :groups do
      get "join" => "groups#join"
      get "new/mail" => "groups#new_mail"
      get "send/mail" => "groups#send_mail"
      delete "all_destroy" => 'groups#all_destroy'
  end


  devise_scope :user do
    post 'users/guest_sign_in' , to: 'users/sessions#guest_sign_in'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
