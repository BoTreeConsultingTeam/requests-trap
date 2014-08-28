class TrappedRequestsController < ApplicationController

  # GET
  #    /admin/subscribers/:subscriber_id/requests(.:format)
  #    /:subscriber_trapping_code/requests(.:format)
  def index
    set_subscriber

    if @subscriber.present?
      @trapped_requests = @subscriber.trapped_requests.order('created_at DESC')
    end

    respond_to do |format|
       format.html
       format.js {
         render file: "trapped_requests/refresh_trapped_requests_listing"
       }
    end
  end

  # GET
  #   /admin/subscribers/:subscriber_id/requests/:id(.:format)
  #   /:subscriber_trapping_code/requests/:id(.:format)
  def show
    set_subscriber

    if @subscriber.present?
      @trapped_request = @subscriber.trapped_requests.where(id: params[:id]).first
    end

  end

  # GET
  #   /admin/subscribers/:subscriber_id/requests/:id(.:format)
  #   /:subscriber_trapping_code/requests/:id(.:format)
  def destroy
    # TODO
  end

  private

  def find_subscriber
    subscriber_id = params[:subscriber_id]
    subscriber_trapping_code = params[:subscriber_trapping_code]

    subscriber = nil
    if subscriber_id.present?
      subscriber = Subscriber.find_by_id(subscriber_id)
    elsif subscriber_trapping_code.present?
      subscriber = Subscriber.find_by_trapping_code(subscriber_trapping_code)
    end

    subscriber
  end

  def set_subscriber
    @subscriber = find_subscriber
  end

end