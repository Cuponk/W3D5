class PolyTreeNode
    attr_reader :value, :parent, :children
    
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    if self.parent != nil
        self.parent.children.delete(self)        
    end
    @parent = new_parent
    if new_parent != nil
        new_parent.children << self if !new_parent.children.include?(self)    
    end
    self
  end

  def add_child(child_node)
	self.children << child_node 
	child_node.parent = self
  end

  def remove_child(child_node)
	raise 'error' unless self.children.include?(child_node)
	self.children.delete(child_node)
	child_node.parent = nil
  end

  def dfs(target_value)
	return self if self.value == target_value
	return nil if self.children.empty?

	self.children.each do |child|
		memo = child.dfs(target_value) 
		return memo if !memo.nil?
	end
	nil
  end
end