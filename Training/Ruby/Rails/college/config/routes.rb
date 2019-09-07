Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'home#index'
  get 'about' => 'about#index'

  get 'departments' => 'departments#index'

  get 'departments/new' => 'departments#new'
  post 'departments' => 'departments#add'

  get 'departments/:id' => 'departments#view'

  get 'departments/edit/:id' => 'departments#edit'
  patch 'departments' => 'departments#update'

  delete 'departments' => 'departments#delete'


  get 'success/:msg' => 'home#success'


  resources :departments

  get 'section' => 'sections#index'

  get 'sections/new' => 'sections#new'
  post 'sections' => 'sections#add'

  get 'sections/:id' => 'sections#view'

  get 'sections/edit/:id' => 'sections#edit'
  patch 'sections' => 'sections#update'

  delete 'sections' => 'sections#delete'


  get 'success/:msg' => 'home#success'


  resources :sections

  #get 'teacher' => 'teacher#index'


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
