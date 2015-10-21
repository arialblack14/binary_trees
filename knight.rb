class Board
	attr_accessor :x, :y, :squares

	def initialize
		@x = nil
		@y = nil
		@squares = []
	end

	def start_game
		puts "What are the coordinates of your knight's position?"
		get_coordinates
		check_coordinates @x, @y
		built_squares 8, 8
		starting_position @x, @y
	end

	def get_coordinates
		puts "x first please :"
		@x = gets.chomp.to_i
		puts "And now y :"
		@y = gets.chomp.to_i
	end

	def check_coordinates x, y
		get_coordinates if (@x.nil? || @y.nil?)
		
		puts "Your knight is on [#{@x},#{@y}]."
	end

	def built_squares width, height
		# Creating an array of specific width
		# This way all elements initially will be nil
		@squares = Array.new(width)
		# For every element of the width array create a new array
		@squares = @squares.map! { Array.new(height) }
	end

	def starting_position x, y
		puts @squares[@x][@y] = "start"
	end
end

class Knight
	attr_accessor :starting_point, :end_point

	def initialize starting_point, end_point
		@starting_point = starting_point
		@end_point = end_point
	end

	def knight_moves starting_point, end_point
	
	end
end

game = Board.new
game.start_game