class TrapRequestController < ApplicationController

  # GET|POST|PUT|DELETE /:subscriber_trapping_code(.:format)
  def create
    # TODO: I don't think this is the right place to to set the request datetime
    # here.It should be done using some middleware because before reaching
    # this point the request is already processed by Rack and other middlewares
    # involved with Rails.
    request_datetime = Time.now.utc

    set_subscriber

    status_message = []
    status_code = 200
    if @subscriber.present?
      trapped_request = trap_request(@subscriber, request_datetime)
      if trapped_request.persisted?
        status_message << "Successfully trapped the request(id: #{trapped_request.id}) for subscriber with trapping code #{subscriber_trapping_code_from_params}."
      else
        status_code = 500
        status_message << "Could not trap the request successfully"
      end
    else
      status_code = 412
      status_message << "Request Details could not be successfully trapped."
      status_message << "Subscriber with trapping code #{subscriber_trapping_code_from_params} could not be found"
    end

    render text: status_message.join(''), status: status_code
  end

  private

  def subscriber_trapping_code_from_params
    params[:subscriber_trapping_code]
  end

  def find_subscriber
    subscriber = Subscriber.find_by_trapping_code(subscriber_trapping_code_from_params)
  end

  def set_subscriber
    @subscriber = find_subscriber
  end

  def trap_request(subscriber, request_datetime)
    request_method = request.method
    remote_ip = request.remote_ip
    headers = filter_request_headers
    query_params = request.query_parameters
    request_params = request.request_parameters if request.post?
    received_cookies = headers["HTTP_COOKIE"]
    scheme = request.protocol
    request_date = request_datetime

    # Rails.logger.debug "========request method: #{request_method}"
    # Rails.logger.debug "========remote ip: #{remote_ip}"
    # Rails.logger.debug "========headers: #{headers}"
    # Rails.logger.debug "========query params #{query_params}"
    # Rails.logger.debug "========request params: #{request_params}"
    # Rails.logger.debug "========cookies: #{received_cookies}"
    # Rails.logger.debug "========scheme: #{scheme}"
    # Rails.logger.debug "========request date: #{request_date}"

    trapped_request_attrs = {
      request_method:     request_method,
      remote_ip:          remote_ip,
      headers:            convert_hash_to_delimited_string(headers),
      query_parameters:   convert_hash_to_delimited_string(query_params),
      request_parameters: convert_hash_to_delimited_string(request_params),
      cookies:            received_cookies,
      request_date:       request_datetime,
      scheme:             scheme
    }

    trapped_request = subscriber.trapped_requests.create(trapped_request_attrs)
    trapped_request
  end

  def filter_request_headers
    filtered_headers = request.env.inject({}) do |memo_hash, header|
                          key = header[0]

                          # Exclude Headers like action_dispatch.cookies,  rack.request.cookie_hash
                          unless key.start_with?("action_", "rack")
                            value = header[1]
                            memo_hash[key] = CGI::unescape(value)
                          end
                          memo_hash
                        end
    filtered_headers
  end

  def convert_hash_to_delimited_string(hash, delimiter="~")
    return "" unless hash.present?

    # TODO: In case the data contains the delimiter then it should be somehow
    # removed else parsing the data, using the specified delimiter, for rendering
    # to the user would behave in an improper manner.
    hash.to_a.map { |arr| "#{arr.first}=#{arr.last}"  }.join(delimiter)
  end

end