module ApplicationHelper
  def back_button(title='Back', path=root_path)
     link_to(title, path, class: 'btn btn-primary')
  end

  def set_back_to_home_button
    content_for :back_to_home do
      back_button("Back To Home")
    end
  end

  def back_button_from_trapped_requests_page(params)
    if params[:subscriber_id].present?
      back_button("Back To Subscribers Listing", admin_subscribers_path)
    else
      back_button("Back To Home")
    end
  end

  def back_button_from_trapped_request_page(params)
    subscriber_id = params[:subscriber_id]
    if subscriber_id.present?
      back_button("Back To Subscriber Trapped Requests Listing", admin_subscriber_trapped_requests_path(subscriber_id: subscriber_id))
    else
      back_button("Back To Home")
    end
  end

  def set_page_header(header_text, show_home_button=true)
    content_for(:page_header, header_text)
    set_back_to_home_button if show_home_button
  end

  def format_date(date)
    return if date.blank?
    date.strftime("%b %e, %Y")
  end

  def format_datetime(datetime)
    return if datetime.blank?
    datetime.strftime("%b %e, %Y %H:%M:%S")
  end

end
