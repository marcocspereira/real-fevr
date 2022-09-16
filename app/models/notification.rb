# == Schema Information
#
# Table name: notifications
#
#  id         :uuid             not null, primary key
#  message    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :uuid             not null
#
# Indexes
#
#  index_notifications_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#
class Notification < ApplicationRecord
  belongs_to :player

  validates :message, presence: true

  def self.clean_old
    puts 'cu'
    where('created_at > ?', 1.week.ago).destroy_all
  end
end
