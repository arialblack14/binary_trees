# http://www.mikeperham.com/2014/11/26/building-a-binary-tree-with-enumerable/

class Node
	attr_accessor :data, :left, :right, :arr

	def initialize data
		@data = data
		@arr = []
	end

	def build_tree arr
		arr.each do |element|
			element = data.new
		end
	end
end

# Examples
root = Node.new(7)
root.left = Node.new(3)
root.right = Node.new(12)