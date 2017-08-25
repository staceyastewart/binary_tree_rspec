class Node

  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

end

class Tree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(newNode)
    if @root.nil?
      @root = newNode
    else
      addNode(newNode, @root)
    end
  end

  def addNode(newNode, currentNode)
    if newNode.value < currentNode.value
      if currentNode.left.nil?
        currentNode.left = newNode.value
      else
        addNode(newNode, currentNode.left)
      end
    else
      if currentNode.right.nil?
        currentNode.right = newNode.value
      else
        addNode(newNode, currentNode.right)
      end
    end
  end

end
