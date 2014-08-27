class RemoveQueryStringFromTrappedRequests < ActiveRecord::Migration
  def up
    remove_column :trapped_requests, :query_string
  end

  def down
    add_column :trapped_requests, :query_string, :string
  end
end
