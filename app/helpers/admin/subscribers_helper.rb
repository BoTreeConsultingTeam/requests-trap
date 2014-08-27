module Admin::SubscribersHelper
  def subscriber_trapped_requests_link(subscriber)
    # TODO
    href = subscriber.present? ? "#" : "#"
    link_to("Trapped Requests", href)
  end

  def subscriber_edit_link(subscriber)
    href = subscriber.present? ? edit_admin_subscriber_path(subscriber) : "#"
    link_to("Edit", href)
  end

  def subscriber_remove_link(subscriber)
    href = subscriber.present? ? admin_subscriber_path(subscriber) : "#"
    link_to("Remove", href, method: :delete, data: { confirm: 'Are you sure?' })
  end

end