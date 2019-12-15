require 'pry'
require_relative 'voronoi'

bst = BST.new
bst.insert(Point.new(7,0))
bst.insert(Point.new(3,0))
bst.insert(Point.new(4,0))
root = bst.send(:root)
p root.point.x
p root.left.point.x
p root.right.point.x