Rails.application.routes.draw do
  resources :projects do
    member do
      get 'submit' => 'projects#submit'
      get 'withdraw' => 'projects#withdraw'
    end
  end

  resources :users,
    only: [:new, :create],
    path_names: { new: "signup"}

  get 'my_investments' => 'investments#my_investments'
  get 'my_projects' => 'projects#my_projects'

  resources :investments do
    member do
      get 'invest' => 'investments#invest'
      get 'divest' => 'investments#divest'
    end
  end

  root 'welcome#index'
  get 'about' => 'about#index'
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'business_canvas' => 'about#business_canvas'
  get 'team' => 'about#team'
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
