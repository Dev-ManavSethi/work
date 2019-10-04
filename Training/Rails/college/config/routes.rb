require 'sidekiq/web'

Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'about' => 'about#index'

  get '/department/assignment' => 'departments#assignment'
  get '/department/name' => 'departments#get_name'
  post '/department/name' => 'departments#get_department'

  resources :departments
  get '/departments/select' => 'departments#select'
  get '/department/search' => 'departments#search'
  
  

  resources :sections
  get 'sections/select' => 'sections#select'

  resources :teachers

  resources :subjects

  resources :students

  resources :exams

  resources :assignments

  get '/signup' => 'signup#index'
  post '/signup' => 'signup#signup'

  get '/login' => 'login#index'
  post '/login' => 'login#verify'

  delete '/logout' => 'logout#logout'

  resources :users

  resources :admins

  get '/admin/signup' => 'admins#new'
  post '/admin/signup' => 'admins#create'

  get '/admin/login' => 'admins#login'
  post '/admin/login' => 'admins#verify'
  
  delete '/admin/logout' => 'admins#logout'

  %w( 404 422 500 ).each do |code|
    get code, controller: 'application', action: 'error', code: code
  end




  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
