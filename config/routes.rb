DraftTool::Application.routes.draw do
  root :to => 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :team_settings

  post 'players/:id/toggle_selected' => 'players#toggle_selected'
  post 'players/:id/toggle_removed' => 'players#toggle_removed'
  post 'players/:id/toggle_marked' => 'players#toggle_marked'
  get "/set_session_sort" => "teams#set_session_sort"
  get "/set_session_sort" => "teams#set_session_sort"
  get '/teams/:id/update_stats' => 'teams#update_player_stats'

  devise_for :users
  resources :teams
  ActiveAdmin.routes(self)

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

def toggle_selected_path(player)
  "/players/#{player.id}/toggle_selected"
end

def toggle_removed_path(player)
  "/players/#{player.id}/toggle_removed"
end

def toggle_marked_path(player)
  "/players/#{player.id}/toggle_marked"
end

def set_session_sort_path
  "/set_session_sort"
end

def update_team_stats_path(team)
  "/teams/#{team.id}/update_stats"
end
