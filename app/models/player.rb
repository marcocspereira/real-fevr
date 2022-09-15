# == Schema Information
#
# Table name: players
#
#  id          :uuid             not null, primary key
#  birthdate   :date
#  name        :string
#  nationality :string
#  number      :integer
#  position    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Player < ApplicationRecord
  has_many :notifications, dependent: :destroy

  POSITIONS = %w(G D M A).freeze

  validates :position, inclusion: { in: POSITIONS }
  validates :number, numericality: { greater_than_or_equal_to: 0,
                                     allow_blank: true }
end
