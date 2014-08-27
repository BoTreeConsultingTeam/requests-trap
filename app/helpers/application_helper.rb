module ApplicationHelper
  def set_page_header(header_text, show_home_button=true)
    content_for(:page_header, header_text)
    if show_home_button
      content_for :back_to_home do
        link_to("Back To Home", root_path, class: 'btn btn-primary')
      end
    end
  end

  def format_date(date)
    return if date.blank?
    date.strftime("%b %e, %Y")
  end
end
