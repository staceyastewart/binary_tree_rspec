require "rspec"

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
        currentNode.left = newNode
      else
        addNode(newNode, currentNode.left)
      end
    else
      if currentNode.right.nil?
        currentNode.right = newNode
      else
        addNode(newNode, currentNode.right)
      end
    end
  end

  def find(value)
    if value < @root
      if @root.left.nil?
        return false
      elsif currentNode.left == value
        return currentNode.left
      else
        findNode(value, currentNode.left)
      end
    else
      if @root.right.nil?
        return false
      elsif currentNode.right == value
        return currentNode.right
      else
        findNode(value, currentNode.right)
      end
    end
  end

  def findNode(value, currentNode)
    if value < currentNode.value
      if currentNode.left.nil?
        return false #this doesn't exist
      elsif currentNode.left == value
        return currentNode.left
      else
        findNode(value, currentNode.left)
      end
    else
      if currentNode.right.nil?
        return false #this doesn't exist
      elsif currentNode.right == value
        return currentNode.right
      else
        findNode(value, currentNode.right)
      end
    end
  end
end

RSpec.describe Node do
  y = Node.new(10, 5, 15)
  x = Node.new(5)

  describe "instantiation" do
    it "should have left and right attributes that are nil" do
      expect(x.left).to eq(nil)
      expect(x.right).to eq(nil)
    end
    it "can be instantiated with value, left, and right values" do
      expect(y.left).to_not be_nil
      expect(y.right).to_not be_nil
      expect(y.value).to_not be_nil
    end
  end
end

RSpec.describe Tree do
  y = Node.new(10)
  x = Node.new(5)
  tree = Tree.new

  describe "instantiation" do
    it "should have a root that is nil" do
      expect(tree.root).to eq(nil)
    end
  end

  describe "add node" do
    it "should add a root node to the tree" do
      tree.add(y)
      expect(tree.root).to_not be_nil
    end
    it "should add a second node to tree" do
      tree.add(x)
      # expect(y.left).to eq(x)
    end
  end
end
