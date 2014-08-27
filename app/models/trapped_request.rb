class TrappedRequest < ActiveRecord::Base
  attr_accessible :cookies, :headers, :query_parameters, :request_parameters, :remote_ip
  attr_accessible :request_date, :scheme, :raw_response, :request_method

  belongs_to :subscriber
end
