# frozen_string_literal: true

class Serializer
  attr_reader :record

  def initialize(record)
      @record = record 
  end

  def serialize
      record.to_json(:except => [:created_at, :updated_at])
  end
end
