Wheretowait::Application.routes.draw do




  # The priority is based upon order of creation:
  # first created -> highest priority.
  match '/dashboard' => 'dashboard#index', :as => :user_root

  resources :flagged_words
  resources :questionnaires do
    resources :user_answers
    get :needs_moderation, :on => :collection
  end
  resources :contacts
  resources :user_answers
  resources :answers
  resources :questions
  resources :question_answers
  resources :locations do
    resources :questionnaires
  end

  resources :members
  devise_for :users

  # last created -> lowest priority
  match '/terms' => 'site#terms', :as => :terms
  match '/privacy' => 'site#privacy', :as => :privacy
  match '/about' => 'site#about', :as => :about
  match '/guidelines' => 'site#guidelines', :as => :guidelines
  match '/faq' => 'site#faq', :as => :faq

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
  # root :to => 'welcome#index'
  root :to => 'site#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
