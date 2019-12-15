# frozen_string_literal: true

require_relative 'bst'
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
    @arcs = BST.new
    # Initialize DCEL.
    @dcel = DCEL.new
  end

  def call
    while !@events.empty?
      e = @events.delete_max

      case e.type
      when 'site'
        # Add the event and breakpoints to BST (by x coordinate).
        node = @arcs.insert(e.point)

        # Add new edge in DCEL.
        @dcel.add_edge(node)

        # Get neighbours of node to delete false alarms and check potential circle events.
        l1 = node.left_leaf
        l2 = l1.left_leaf
        r1 = node.right_leaf
        r2 = r1.right_leaf

        # Delete false alarms for circle events.
        [[l1,l2,r1],[l2,r1,r2]]
          .map { |nodes| Circle.new(nodes.map(&:point)) }
          .select(&:circle_event?)
          .map(&:event_point)
          .map { |point| @events.delete(CircleEvent.new(point)) }

        # Check three possible circles with our new site in T.
        # And add it to queue.
        [[l1, l2, node], [l2, node, r1], [node, r1, r2]]
          .map { |nodes| Circle.new(nodes.map(&:point)) }
          .select(&:circle_event?)
          .map(&:event_point)
          .map { |point| @events.push(CircleEvent.new(point)) }
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
        @vertices.push(p)

        # Output segments (q,r) and (r,s).
      end
    end

    # Finish all edges having pointers from BST.
  end
end