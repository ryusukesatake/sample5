    Rails.application.routes.draw do
    devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
    resources :users, only: [:index, :show]

    get 'tweets/page1' => 'tweets#page1'
    get 'tweets/page2' => 'tweets#page2'
    get 'tweets/page3' => 'tweets#page3'
    get 'tweets/page4' => 'tweets#page4'
    get 'tweets/page5' => 'tweets#page5'
    get 'tweets/page6' => 'tweets#page6'
    get 'tweets/page7' => 'tweets#page7'
    get 'tweets/page8' => 'tweets#page8'
    get 'tweets/page9' => 'tweets#page9'
    get 'tweets/page10' => 'tweets#page10'
    get 'tweets/page11' => 'tweets#page11'
    get 'tweets/page12' => 'tweets#page12'
    
    root "tweets#index"

    resources :messages, :only => [:create]
    resources :rooms, :only => [:create, :show, :index]
    resources :tweets do
      resources :likes, only: [:create, :destroy] 
      resources :comments, only: [:create]
    end  
    resources :relationships, only: [:create, :destroy]

end
