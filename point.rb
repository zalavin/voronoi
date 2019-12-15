# frozen_string_literal: true

Point = Struct.new(:x,:y) do
  def >(other)
    y > other.y
  end

  def >=(other)
    y >= other.y
  end

  def <=(other)
    y <= other.y
  end
end