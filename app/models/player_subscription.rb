# == Schema Information
#
# Table name: player_subscriptions
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id  :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_player_subscriptions_on_player_id              (player_id)
#  index_player_subscriptions_on_user_id                (user_id)
#  index_player_subscriptions_on_user_id_and_player_id  (user_id,player_id) UNIQUE
#
class PlayerSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :player

  scope :subscribers_ids, lambda { |player_id|
    where(player_id: player_id).pluck(:user_id)
  }
end
