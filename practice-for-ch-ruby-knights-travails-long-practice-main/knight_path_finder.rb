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
				return trace_path_back(shift)
            else
                shift.children.each { |i| queue << i }
            end
            
        end
        return nil 
    end

	def trace_path_back(node)
		node_arr = []
		value_arr = []

		node_arr << node.parent
		value_arr << node.parent.value
		while !node_arr[0].parent.nil?		
			node_arr.unshift(node_arr[0].parent)
			value_arr.unshift(node_arr[0].value)
		end
		node_arr << node 
		value_arr << node.value
		value_arr
	end
end
# test = KnightPathFinder.new([0, 0])

# p KnightPathFinder.valid_moves([4, 3])
# p test.new_move_positions([4, 3])
# p test.new_move_positions([2, 2])
# p test.find_path([4,2])
kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

