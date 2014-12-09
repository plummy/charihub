Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users, :controllers => {registrations: 'user/registrations', sessions: 'user/sessions'}

  get "/home", to: 'home#index'
  get "/dashboard", to: 'static_pages#dashboard'
  get "/user", to: 'user#profile'
  #get "/user/update", to: 'user#edit'

  resources :posts

  resource :static_pages do
    member do
      get 'preview_stats'
      get 'preview_map'
      get 'preview_dashboard'
    end
  end
  match "dashboard/create_post(.:format)" => "static_pages#create_post", as: :create_post, via: :post
  match "user/update(.:format)" => "user#update_profile", as: :update_profile, via: :patch
  get "/user/account(.:format)" => "user#edit", as: :account

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
