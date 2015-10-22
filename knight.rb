MOVES = [[1, 2],[1, -2],[2, 1],[2,-1],
        [-1, 2],[-2, 1],[-1, -2],[-2, -1]]

Knight = Struct.new(:start, :parent)

class Board
  def initialize board_size = 8
    @board_size = board_size
  end

  def knight_moves root, target
    return nil unless (valid_position?(root) && valid_position?(target))
    return root if root == target

    knight = Knight.new(root, nil)
    # Enqueue starting position and mark as visited
    queue = [knight]
    visited = []
    solution = []

    while knight.start != target do
      knight = queue.shift

      if !visited.include?(knight)
        visited << knight
        check_moves(knight.start).each do |i|
          k = Knight.new(i, knight)
          queue << k
        end        
      end
    end

    solution << knight.start
    while knight.parent != nil
      solution << knight.parent.start
      knight = knight.parent
    end

    puts "You made it in #{(solution.size)-1} moves!"
    solution.reverse.each { |knight_move| p knight_move }

  end

  def valid_position? pos
    pos[0].between?(0, @board_size-1) && pos[1].between?(0, @board_size-1)
  end

  def check_moves root
    valid_moves = []
    MOVES.each { |m| valid_moves << current_move(root, m) if valid_position?(current_move(root, m)) }
    valid_moves
  end

  def current_move root, m
    [root[0] + m[0], root[1] + m[1]]
  end
end

# Tests
board = Board.new
board.knight_moves([3,3],[4,3])
board.knight_moves([3,3],[7,3])
board.knight_moves([3,3],[1,2])