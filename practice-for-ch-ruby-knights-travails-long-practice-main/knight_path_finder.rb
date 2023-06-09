require_relative 'practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb'

class KnightPathFinder
    def initialize(start)
        @self.root_node = PolyTreeNode.new(start)
        self.build_move_tree
        @considered_positions = [start]
    end
    MOVE_DIRECTIONS = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
	def self.valid_moves(pos)
        moves = []
        MOVE_DIRECTIONS.each do |direction|
            new_positions = [direction[0] + pos[0], direction[1] + pos[1]]
            if (0..7).include?(new_positions[0]) && (0..7).include?(new_move_positions[1])
                moves << new_positions
            end
        end
        moves
	end

	def new_move_positions(pos)
        res = []
        KnightPathFinder.valid_moves(pos).reject { |i| considered_positions.include?(i) ? res << i : @considered_positions << i }
        res
	end

	def build_move_tree
		queue = []
		queue << @self.root_node
        while !queue.empty?
            temp = queue.shift
            new_move_positions(temp).each do |ele|
                queue << ele if !@considered_positions.include?(ele)
            end
        end
	end
end