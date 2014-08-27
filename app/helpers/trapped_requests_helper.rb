module TrappedRequestsHelper
  def find_user_context(params)
    if params[:subscriber_id].present?
      :admin
    else
      :subscriber
    end
  end

  def trapped_request_show_link(trapped_request, user_context)
    if :admin == user_context
      trapped_request_show_link_for_admin(trapped_request)
    else
      trapped_request_show_link_for_subscriber(trapped_request)
    end
  end

  def trapped_request_show_link_for_admin(trapped_request)
    href = "#"
    if trapped_request.present?
      href = admin_subscriber_trapped_request_path(
               subscriber_id: trapped_request.subscriber_id,
               id: trapped_request.id)
    end

    link_to("View All Details", href)
  end

  def trapped_request_show_link_for_subscriber(trapped_request)
    href = "#"
    if trapped_request.present?
      subscriber = trapped_request.subscriber
      if subscriber.present?
        subscriber_trapping_code = subscriber.subscriber_trapping_code
        href = request_path(
                 subscriber_trapping_code: subscriber_trapping_code,
                 id: trapped_request.id)
      end
    end

    link_to("View All Details", href)
  end

  def format_delimited_data_string(delimited_data_string, delimiter="~")
    return "" unless delimited_data_string.present?

    delimited_data_string.gsub(delimiter, "\n")
  end

end