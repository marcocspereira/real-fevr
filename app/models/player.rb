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

end
