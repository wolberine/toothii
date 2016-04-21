Rails.application.routes.draw do
  # Routes for the Procedure resource:

  # CREATE
  get "/procedures/new", :controller => "procedures", :action => "new"
  post "/create_procedure", :controller => "procedures", :action => "create"

  # READ
  get "/procedures", :controller => "procedures", :action => "index"
  get "/procedures/:id", :controller => "procedures", :action => "show"

  # UPDATE
  get "/procedures/:id/edit", :controller => "procedures", :action => "edit"
  post "/update_procedure/:id", :controller => "procedures", :action => "update"

  # DELETE
  get "/delete_procedure/:id", :controller => "procedures", :action => "destroy"
  #------------------------------

  # Routes for the Rating resource:
  # CREATE
  get "/ratings/new", :controller => "ratings", :action => "new"
  post "/create_rating", :controller => "ratings", :action => "create"

  # READ
  get "/ratings", :controller => "ratings", :action => "index"
  get "/ratings/:id", :controller => "ratings", :action => "show"

  # UPDATE
  get "/ratings/:id/edit", :controller => "ratings", :action => "edit"
  post "/update_rating/:id", :controller => "ratings", :action => "update"

  # DELETE
  get "/delete_rating/:id", :controller => "ratings", :action => "destroy"
  #------------------------------

  # Routes for the Transaction resource:
  # CREATE
  get "/transactions/new", :controller => "transactions", :action => "new"
  post "/create_transaction", :controller => "transactions", :action => "create"

  # READ
  get "/transactions", :controller => "transactions", :action => "index"
  get "/transactions/:id", :controller => "transactions", :action => "show"

  # UPDATE
  get "/transactions/:id/edit", :controller => "transactions", :action => "edit"
  post "/update_transaction/:id", :controller => "transactions", :action => "update"

  # DELETE
  get "/delete_transaction/:id", :controller => "transactions", :action => "destroy"
  #------------------------------

  # Routes for the Bill resource:
  # CREATE
  get "/bills/new", :controller => "bills", :action => "new"
  post "/create_bill", :controller => "bills", :action => "create"

  # READ
  get "/bills", :controller => "bills", :action => "index"
  get "/bills/:id", :controller => "bills", :action => "show"

  # UPDATE
  get "/bills/:id/edit", :controller => "bills", :action => "edit"
  post "/update_bill/:id", :controller => "bills", :action => "update"

  # DELETE
  get "/delete_bill/:id", :controller => "bills", :action => "destroy"
  #------------------------------

  # Routes for the Patient resource:
  # CREATE
  get "/patients/new", :controller => "patients", :action => "new"
  post "/create_patient", :controller => "patients", :action => "create"

  # READ
  get "/patients", :controller => "patients", :action => "index"
  get "/patients/:id", :controller => "patients", :action => "show"

  # UPDATE
  get "/patients/:id/edit", :controller => "patients", :action => "edit"
  post "/update_patient/:id", :controller => "patients", :action => "update"

  # DELETE
  get "/delete_patient/:id", :controller => "patients", :action => "destroy"
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'patients#index'

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
