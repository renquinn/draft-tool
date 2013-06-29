DraftTool::Application.routes.draw do
  resources :team_settings

  match 'players/:id/mark_selected' => 'players#mark_selected'
  match 'players/:id/mark_unselected' => 'players#mark_unselected'

  match 'players/:id/mark_removed' => 'players#mark_removed'
  match 'players/:id/mark_unremoved' => 'players#mark_unremoved'

  match 'players/:id/mark_marked' => 'players#mark_marked'
  match 'players/:id/mark_unmarked' => 'players#mark_unmarked'

  devise_for :users
  resources :teams

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

def mark_as_selected_path(player)
  "/players/#{player.id}/mark_selected"
end

def mark_as_unselected_path(player)
  "/players/#{player.id}/mark_unselected"
end

def mark_as_removed_path(player)
  "/players/#{player.id}/mark_removed"
end

def mark_as_unremoved_path(player)
  "/players/#{player.id}/mark_unremoved"
end

def mark_as_marked_path(player)
  "/players/#{player.id}/mark_marked"
end

def mark_as_unmarked_path(player)
  "/players/#{player.id}/mark_unmarked"
end
