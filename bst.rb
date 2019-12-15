# frozen_string_literal: true

# Balanced binary search tree.
# Stores in leaves points, whereas on nodes — two points.
class BST
  Node = Struct.new(:point, :left, :right, :parent) do
    def leaf?
      left.nil? && right.nil?
    end
  end

  def initialize
    @root = nil
  end

  # To insert a new point we find closest x coordinate.
  def insert(point)
    if @root.nil?
      @root = insert_node(root, point)
    else
      node = insert_node(root, point)
      # parent = node.parent
      #
      # if parent.left.nil?
      #   dup = Node.new(point)
      #   dup.parent = parent
      #   parent.left = dup
      # elsif parent.right.nil?
      #   dup = Node.new(point)
      #   dup.parent = parent
      #   parent.right = dup
      # end
      #
      # while parent
      #   parent.right.point = parent.point
      #   parent.point = parent.left.point
      # end
    end
  end

  private

  attr_reader :root

  def insert_node(node, point)
    return Node.new(point) if node.nil?

    if point.x > node.point.x
      current = insert_node(node.right, point)
      current.parent = node
      node.right = current
    else
      current = insert_node(node.left, point)
      current.parent = node
      node.left = current
    end

    current
  end
end