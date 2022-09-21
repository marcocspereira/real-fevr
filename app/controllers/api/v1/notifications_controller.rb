module Api::V1
  class NotificationsController < ApplicationController
    before_action :authorize_notification

    # GET api/v1/notifications
    def index
      notifications = Notification.all

      render status: :ok,
             json: NotificationSerializer.new(notifications).serialize
    end

    # GET api/v1/notifications/:id
    def show
      notification = Notification.find(params[:id])

      render status: :ok,
             json: NotificationSerializer.new(notification).serialize
    end

    # POST api/v1/notifications
    def create
      notification = Notification.new(notification_params)
      notification.save!

      render status: :created,
             json: NotificationSerializer.new(notification).serialize
    end

    # PUT api/v1/notifications/:id
    def update
      notification = Notification.find(params[:id])
      notification.update!(notification_params)

      render status: :ok,
             json: NotificationSerializer.new(notification).serialize
    end

    # DELETE api/v1/notifications/:id
    def destroy
      Notification.destroy(params[:id])

      render status: :ok,
             json: {}
    end

    private

    def authorize_notification
      authorize Notification
    end

    def notification_params
      params.require(:notification).permit(:id, :player_id, :message)
    end

  end
end