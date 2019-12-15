# frozen_string_literal: true

class PQ
  def initialize
    @a = []
    @entries = {}
  end

  def insert(point)
    return if entries.has_key?(point)

    n = a.length
    a[n] = point
    entries[point] = point
    siftup(n)
  end

  def extract_max
    fail 'EmptyPQ' if empty?

    max = a[0]
    a[0] = a.pop
    siftdown(0)
    entries.delete(max)
    max
  end

  def delete(point)
    entries.delete(point)
  end

  def empty?
    entries.none?
  end

  private

  attr_reader :a, :entries

  def siftup(i)
    while i > 0 && a[i] > a[(i - 1) / 2]
      a[i], a[(i - 1) / 2] = a[(i - 1) / 2], a[i]
      i = (i - 1) / 2
    end
  end

  def siftdown(i)
    while 2 * i + 1 > a.length
      left = 2 * i + 1
      right = 2 * i + 2
      j = left

      if right < a.length && a[right] < a[left]
        j = right
      end

      if a[i] <= a[j]
        return
      end

      a[i], a[j] = a[j], a[i]
      i = j
    end
  end
end