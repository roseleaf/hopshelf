Hopshelf::Application.routes.draw do

  resources :users, :user_sessions, :books, :regions, :genres, :messages, :comments, :contacts
 
  # Sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  

  # Public Pages
  root :to => 'public#index'
  match 'about' => 'public#about'
  match '/:page' => 'public#page'

  # Signup
  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
 
  # Forgot Password
  match 'forgot_password' => 'user_sessions#forgot_password', :as => :forgot_password, :via => :get
  match 'forgot_password' => 'user_sessions#forgot_password_lookup_email', :as => :forgot_password, :via => :post

  put 'reset_password/:reset_password_code' => 'users#reset_password_submit', :as => :reset_password, :via => :put
  get 'reset_password/:reset_password_code' => 'users#reset_password', :as => :reset_password, :via => :get  

  #Odd Cases
  match 'users/:user_id/books/' => 'users#books', :as => :user_books
  match 'regions/:id' => 'regions#users', :as => :user_regions
  match 'books/:book_id/message/' => 'messages#new', :as => :new_message_book
  match 'books/:id/' => 'comment#new', :as => :comment_book
  match 'deletecom' => 'books#destroy', :as => :deletebk
  match 'contact' => 'contacts#new', :as => :contacts_new
  match 'contacts' => 'contacts#new'





  resources :comments do
    resources :comments
  end

  resources :books do
    resources :comments
  end
  
  resources :users do
    resources :messages
  end

end
