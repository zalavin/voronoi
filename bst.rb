# frozen_string_literal: true

# Balanced binary search tree.
# Stores in leaves points, whereas on nodes — two points.
class BST
  Node = Struct.new(:point, :left, :right)

  def initialize
    @root = nil
  end

  # To insert a new point we find closest x coordinate.
  def insert(point)
    @root = insert_node(root, point)
  end

  private

  attr_reader :root

  def insert_node(node, point)
    return Node.new(point) if node.nil?

    if point.x > node.point.x
      node.right = insert_node(node.right, point)
    else
      node.left = insert_node(node.left, point)
    end

    node
  end
end