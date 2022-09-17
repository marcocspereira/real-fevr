class NotifierJob < ApplicationJob
  queue_as :default

  def perform(resource_id)
    # Simulates a long, time-consuming task
    sleep 5
    puts "NotifierJob: #{resource_id}"
    # Will display current time, milliseconds included
    p "hello from NotifierJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
    NotifierService.publish(resource_id)
  end
end