class RenameQueryParamsToQueryParametersInTrappedRequests < ActiveRecord::Migration
  def up
    rename_column(:trapped_requests, :query_params, :query_parameters)
  end

  def down
    rename_column(:trapped_requests, :query_parameters, :query_params)
  end
end
