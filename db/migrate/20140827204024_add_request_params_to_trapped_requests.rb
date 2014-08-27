class AddRequestParamsToTrappedRequests < ActiveRecord::Migration
  def change
    add_column :trapped_requests, :request_parameters, :text
  end
end
