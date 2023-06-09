require_relative 'practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb'

class KnightPathFinder
    def initialize(start)
        @self.root_node = PolyTreeNode.new(start)
        self.build_move_tree
    end

	def self.valid_moves(pos)
		@considered_positions = []
		@considered_positions << pos
	end

	def new_move_positions(pos)
		if !@considered_positions.include?(pos)
			KnightPathFinder.valid_moves(pos)
		end
	end

	def build_move_tree 
		queue = []
		queue << @self.root_node
	end
end