Rails.application.routes.draw do
  devise_for :users
  resources :userimages
  root 'userimages#my_userimages'
  get "/my_userimages" => "userimages#my_userimages", as: :my_userimages
  get "/share_to_me " => "userimages#sharetome", as: :sharetome
  get "/applyfilter/:type" => "userimages#applyfilter", as: :applyfilter
  get "/share" => "userimages#shareimage", as: :share
  get "/download/:image" => "userimages#download", as: :download
  get "/trash" => "userimages#trash", as: :trash
  get "/remove/:image" => "userimages#remove", as: :remove
  get "/restore/:image" => "userimages#restore", as: :restore
  get "/saveimage/:id" => "userimages#saveimage"
  get "/cancelshare/:imageid" => "userimages#cancelshare", as: :cancelshare
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
end
