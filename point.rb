# frozen_string_literal: true

Point = Struct.new(:x,:y) do
  include Comparable

  def <=>(other)
    y <=> other.y
  end
end