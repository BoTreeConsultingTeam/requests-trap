RequestsTrap::Application.routes.draw do
  root :to => 'welcome#index'

  namespace :admin do
    resources :subscribers
  end

  get 'admin/subscribers/:subscriber_id/requests' => 'trapped_requests#index', as: :admin_subscriber_trapped_requests
  get 'admin/subscribers/:subscriber_id/requests/:id' => 'trapped_requests#show', as: :admin_subscriber_trapped_request
  delete 'admin/subscribers/:subscriber_id/requests/:id' => 'trapped_requests#destroy', as: :admin_subscriber_trapped_request

  scope ":subscriber_trapping_code" do
    resources :requests, controller: "trapped_requests", only: [:index, :show, :destroy]
  end

  match ':subscriber_trapping_code' => 'trap_request#create', via: [:get, :post, :put, :delete]

end
