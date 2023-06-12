require_relative '../practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb'

require 'byebug'
class KnightPathFinder

    attr_reader :considered_positions, :root_node

    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @considered_positions = [start]
        self.build_move_tree
    end
    MOVE_DIRECTIONS = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
	def self.valid_moves(pos)
        moves = []
        MOVE_DIRECTIONS.each do |direction|
            new_positions = [direction[0] + pos[0], direction[1] + pos[1]]
            if (0..7).include?(new_positions[0]) && (0..7).include?(new_positions[1])
                moves << new_positions
            end
        end
        moves
	end

	def new_move_positions(pos)
        new_positions = KnightPathFinder.valid_moves(pos).reject { |i| @considered_positions.include?(i) } #new_positions
        @considered_positions.concat(new_positions)
        new_positions
	end

	def build_move_tree
		queue = []
		queue << @root_node
        while !queue.empty?
            temp = queue.shift
            new_move_positions(temp.value).each do |ele|
                new_child = PolyTreeNode.new(ele)
                temp.add_child(new_child)
                queue << new_child
            end
        end
	end

    def find_path(end_pos)
        queue = []
        queue << @root_node
        while !queue.empty?
            shift = queue.shift
            if shift.value == end_pos
                return shift
            else
                shift.children.each { |i| queue << i }
            end
            
        end
        return nil 
    end
end

test = KnightPathFinder.new([0, 0])

# p KnightPathFinder.valid_moves([4, 3])
# p test.new_move_positions([4, 3])
# p test.new_move_positions([2, 2])
p test.find_path([4,2])

