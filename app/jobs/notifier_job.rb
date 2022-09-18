class NotifierJob < ApplicationJob
  queue_as :default

  def perform(resource, message)
    # Will display current time, milliseconds included
    puts "Hello from NotifierJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"

    NotifierService.publish(resource, message)
  end
end