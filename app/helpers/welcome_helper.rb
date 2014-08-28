module WelcomeHelper
  def administrator_link
    link_text = []
    link_text << "Administrators, please"
    link_text << link_to("click here", admin_subscribers_path)
    link_text << "to access subscribers data"
    link_text.join(" ").html_safe
  end

  def subscriber_link
    requests_default_path = requests_path(subscriber_trapping_code: 'xxx')

    link_text = []
    link_text << "Individual Subscriber, please enter your trapping code here"
    link_text << text_field_tag(:trapping_code, nil, id: 'wc_pg_trapping_code', size: '15px')
    link_text << "and"
    link_text << link_to("click here", requests_default_path, id: 'wc_pg_trapped_requests_link', "data-default-path" => requests_default_path)
    link_text << "view your trapped requests"
    link_text.join(" ").html_safe
  end

end
