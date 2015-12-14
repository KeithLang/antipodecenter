Rails.application.routes.draw do
  
  #This section prevents the sign_up page being displayed but allows sign_in
  devise_scope :admins do
  get "/admins/sign_up",  :to => redirect("/") # home#index"
  end
  ##

  devise_for :admins#, :skip => :registrations  #remove skip registrations to allow new admins
  devise_for :users, :skip => :registrations #remove skip registrations to allow new users
  resources :comments
  #
  resources :posts do
    resources :comments, :only => [:create]
  end
  
  root 'home#index'

  namespace :admin do 
    root "dashboard#index"

    resources :articles do
    end

    

    resources :categories do
    end  
  end

  
  #resources :category
  #get '/category/:id' => 'category#show', as: 'category'

  get '/category/:name' => 'category#show'

  # static controller
  get "/:page" => "static#show"

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
  get '*path' => redirect('/')
end
