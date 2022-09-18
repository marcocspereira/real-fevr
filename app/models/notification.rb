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
  include Notificable

  belongs_to :player, class_name: 'Player', foreign_key: 'player_id'

  validates :message, presence: true

  def resource
    Player.find(player_id)
  end

  def self.clean_old
    Rails.logger.info "Clean_old task"
    where('created_at > ?', 1.week.ago).destroy_all
  end
end
