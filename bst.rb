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
    @root = insert_node(root, point)
  end

  private

  attr_reader :root

  def insert_node(node, point)
    return Node.new(point) if node.nil?

    # until node.leaf?
    #   node = point.x > node.point.x ? node.left : node.right
    # end

    if point.x > node.point.x
      tmp = insert_node(node.right, point)
      tmp.parent = node
      node.right = tmp
    else
      tmp = insert_node(node.left, point)
      tmp.parent = node
      node.left = tmp
    end

    node
  end
end