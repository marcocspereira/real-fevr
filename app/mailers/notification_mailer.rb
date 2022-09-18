class NotificationMailer < ApplicationMailer
  def player_notification_email
    @player = params[:resource]
    @message = params[:message]
    mail(to: params[:recipient], subject: "Player #{@player.name} | new notification")
  end
end
