class Node
	attr_reader :data
	attr_accessor :left, :right

	def initialize data
		@data = data
	end

	def insert_in value
		if value < @data
			if @left.nil?
				@left = Node.new(value)
			else
				@left = @left.insert_in(value)
			end
		else
			if @right.nil?
				@right = Node.new(value)
			else
				@right = @right.insert_in(value)
			end
		end
	end	
	
	def build_tree arr
		return nil if arr.length ==0
		mid = arr.length/2

		node = Node.new(arr[mid])

		node.left = build_tree(arr[0..mid-1])
		node.right = build_tree(arr[mid+1..-1])	
		node
	end
end

# Examples
test_array =  [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts build_tree(test_array)