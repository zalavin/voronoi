# frozen_string_literal: true

Event = Struct.new(:point) do
  include Comparable

  def <=>(other)
    point <=> other.point
  end
end

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