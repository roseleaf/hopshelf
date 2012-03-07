Hopshelf::Application.routes.draw do

  resources :users, :user_sessions, :books, :regions, :genres, :messages, :comments, :contacts
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  match 'users/:id/books/' => 'users#books', :as => :book_user
  match 'regions/:id' => 'regions#users', :as => :user_regions
  match 'books/:id/message/' => 'messages#new', :as => :message_book
  match 'users/:id/message/' => 'messages#index', :as => :message_user
  match 'books/:id/' => 'comment#new', :as => :comment_book
  match 'contact' => 'contacts#new', :as => :contacts_new
  match 'contacts' => 'contacts#new'
  match 'activate(/:activation_code)' => 'users#activate', :as => :activate_account
  match 'send_activation(/:user_id)' => 'users#send_activation', :as => :send_activation
  match 'forgot_password' => 'user_sessions#forgot_password', :as => :forgot_password, :via => :get
  match 'forgot_password' => 'user_sessions#forgot_password_lookup_email', :as => :forgot_password, :via => :post


  put 'reset_password/:reset_password_code' => 'users#reset_password_submit', :as => :reset_password, :via => :put
  get 'reset_password/:reset_password_code' => 'users#reset_password', :as => :reset_password, :via => :get  



  resources :comments do
    resources :comments
  end

  resources :books do
    resources :comments
  end
  




  # match 'contact/new' => 'contact#new', :as => :contact_new

  # match 'users/:id/book/:book_id/' => 'book#bookpage', :as => :bookpage_book

  # match 'new_book' => 'Books#new'
  # match 'all' => "Books#index", :as => "all_books"
  # match ':poster_id' => 'Book#index', :as => 'user_books'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
  root :to => 'public#index'
  match 'about' => 'public#about'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
