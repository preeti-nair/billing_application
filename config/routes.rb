Rails.application.routes.draw do
  get 'generate_event_bill' => "events#event_bill", as: :generate_event_bill
  post 'events' => "events#create_event_bill", as: :events
  post 'invoices' => "invoices#show_break_up", as: :invoices
  get 'events' => 'events#index', as: :all_events
  get 'events/:id' => 'events#show', as: :view_event_details
  get 'events/show_bill/:id' => "events#create_event_bill", as: :create_individual_event_bill
  devise_for :users
  get 'welcome/index'
  get 'welcome/index/:selector' => 'welcome#index', as: :select_schedules 

  resources :categories
  resources :rates
  #resources :schedules
  resources :clients
  resources :employees
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index', as: :home
   get 'client/:id/start_schedule' => 'schedules#start_schedule', as: :start_schedule
   get 'client/:id/stop_schedule' => 'schedules#stop_schedule', as: :stop_schedule
   get 'client/:id/generate_bill/:rate' => 'schedules#generate_bill', as: :generate_bill
   get 'client/:id' => 'clients#show', as: :view_details
  
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
