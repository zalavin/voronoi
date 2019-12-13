# frozen_string_literal: true

Event = Struct.new(:point)

class SiteEvent < Event
  def type
    'site'
  end
end

class CircleEvent < Event
  def type
    'circle'
  end
end