class CreateTrappedRequests < ActiveRecord::Migration
  def change
    create_table :trapped_requests do |t|
      t.datetime :request_date
      t.string   :request_method
      t.string   :remote_ip
      t.string   :scheme
      t.string   :query_string
      t.text     :query_params
      t.string   :cookies
      t.text     :headers
      t.text     :raw_response
      t.integer  :subscriber_id

      t.timestamps
    end
  end
end
