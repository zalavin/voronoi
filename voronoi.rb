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
    # Initialize BST to store beach line.
    # @arcs = BST.new
  end

  def call
    while !@events.empty?
      p = @events.delete_max

      case p.type
      when 'site'
        # Add the event and breakpoints to BST.
        # Find by x coordinate.

        # Add new edge in DCEL.

        # Delete false alarms for circle events.

        # Add potential circle to queue.
        # Check three possible circles with our new site in T.

        # Find arcs containing point p.
        # @arcs.find_occurence(p)
      when 'circle'
        # Create new boundary ray (q,s).
        
        # Replace (q,r) with (q,s) in @arcs.
        
        # Delete from @events any intersection between (u,q) and (q,r).
        # @events.delete(intersections)
        
        # Delete from @events any intersection between (r,s) and (s,v).
        # @events.delete(intersections)

        # Insert into @events any intersection between (u,q) and (q,s).
        # @events.push(intersections)

        # Insert into @events any intersection between (q,s) and (s,v).
        # @events.push(intersections)

        # Add p to vertices.
        # @vertices.push(p)
        
        # Output segments (q,r) and (r,s).
      end
    end

    # Finish all edges having pointers from BST.
  end
end