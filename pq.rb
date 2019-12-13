# frozen_string_literal: true

class PQ
  def intialize
    @pq = []
  end

  # O(1)
  def push(point)
    pq.push(point)
  end

  # O(n)
  def delete_max
    pq.delete(pq.max_by { |e| e.point.y })
  end

  # O(n)
  def delete(point)
    pq.delete(pq.find { |p| p == point })
  end

  # O(1)
  def empty?
    pq.any?
  end

  private

  attr_reader :pq
end