class Admin::SubscribersController < Admin::BaseController

  # GET    /admin/subscribers(.:format)
  def index
    @subscribers = Subscriber.order('name ASC').all
  end

  # GET /admin/subscribers/new(.:format)
  def new
    @subscriber = Subscriber.new
  end

  # POST /admin/subscribers(.:format)
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if @subscriber.save
      set_flash_notice(t('admin.subscriber.message.create.success'))
      redirect_to admin_subscribers_path
    else
      set_model_errors_in_flash(@subscriber)
      render :new
    end
  end

  # GET /admin/subscribers/:id(.:format)
  def show
    set_subscriber
  end

  # GET /admin/subscribers/:id/edit(.:format)
  def edit
    set_subscriber
  end

  # PUT /admin/subscribers/:id(.:format)
  def update
    set_subscriber

    if @subscriber.present?
      @subscriber.attributes = params[:subscriber]
      if @subscriber.save
        set_flash_notice(t('admin.subscriber.message.update.success'))
        redirect_to admin_subscribers_path
      else
        set_model_errors_in_flash(@subscriber)
        render :edit
      end
    else
      set_inexistent_subscriber_error
      redirect_to admin_subscribers_path
    end

  end

  # DELETE /admin/subscribers/:id(.:format)
  def destroy
    set_subscriber

    if @subscriber.present?
      @subscriber.destroy
      set_flash_notice(t('admin.subscriber.message.remove.success'))
    else
      set_inexistent_subscriber_error
    end

    redirect_to admin_subscribers_path
  end

  private

  def set_inexistent_subscriber_error
    set_flash_error(t('admin.subscriber.message.inexistent_subscriber', subscriber_id: subscriber_id_from_params))
  end

  def subscriber_id_from_params
    params[:id]
  end

  def find_subscriber
    Subscriber.find_by_id(subscriber_id_from_params)
  end

 def set_subscriber
    @subscriber = find_subscriber
  end
end