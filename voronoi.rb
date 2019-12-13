# frozen_string_literal: true

class Voronoi
  def initialize(sites)
    @sites = sites
  end

  def call
    # Initialize a PQ to store events, sorted by max y coordinate.
    events = PQ.new
    # Add sites to queue.
    sites.each { |s| events.push(s) }

    while !events.empty?
      p = events.delete_max

      case p.type
      when 'site'
      when 'circle'
      end
    end
  end

  attr_reader :sites
end