module WelcomeHelper
  def administrator_link
    link_text = []
    link_text << "Administrators, please"
    link_text << link_to("click here", admin_subscribers_path)
    link_text << "to access subscribers data"
    link_text.join(" ").html_safe
  end

end
