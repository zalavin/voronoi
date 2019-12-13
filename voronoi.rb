# frozen_string_literal: true

require_relative 'point'
require_relative 'pq'
require_relative 'event'

class Voronoi
  def initialize(sites)
    # Covert sites to points.
    @sites = sites.map { |s| Point.new(s[0], s[1]) }
    # Initialize a PQ to store events, sorted by max y coordinate.
    @events = PQ.new
    # # Add sites to queue.
    @sites.each { |s| events.push(SiteEvent.new(s)) }
  end

  def call
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