# frozen_string_literal: true

require_relative 'point'
require_relative 'pq'
require_relative 'event'

class Voronoi
  def initialize(sites)
    # Initialize a PQ to store events, sorted by max y coordinate.
    @events = PQ.new
    # Add sites to queue.
    sites
      .map { |s| Point.new(s[0], s[1]) }
      .each { |s| @events.push(SiteEvent.new(s)) }
    # Initialize arc.
    @arc = nil
  end

  def call
    while !events.empty?
      p = events.delete_max

      case p.type
      when 'site'
        if arc.nil?
          @arc = Arc.new(p)
        else
        end
        # Find arcs in T containing p,
      when 'circle'
      end
    end

    # Finish all edges having pointers from BST.
  end

  attr_reader :events, :arx
end