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
end