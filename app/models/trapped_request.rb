class TrappedRequest < ActiveRecord::Base
  attr_accessible :cookies, :headers, :query_params, :query_string, :remote_ip
  attr_accessible :request_date, :scheme, :raw_response

  belongs_to :subscriber
end
