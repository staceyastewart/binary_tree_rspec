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
    if value == @root.value
      return @root
    elsif value < @root.value
      if @root.left.nil?
        return false
      elsif @root.left == value
        return @root.left
      else
        findNode(value, @root.left)
      end
    else
      if @root.right.nil?
        return false
      elsif @root.right == value
        return @root.right
      else
        findNode(value, @root.right)
      end
    end
  end

  def findNode(value, currentNode)
    if value == currentNode.value
      return currentNode
    elsif value < currentNode.value
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
  z = Node.new(15)
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
    it "should add a second node to tree that is less than root" do
      tree.add(x)
      expect(y.left).to eq(x)
    end
    it "should add a second node to tree that is greater than root" do
      tree.add(z)
      expect(y.right).to eq(z)
    end
  end

  describe "find node" do
    it "should find a node" do
      expect(tree.find(10)).to_not be_nil
    end
    it "should find the root" do
      expect(tree.find(10)).to eq(y)
    end
    it "should find a node to the right" do
      expect(tree.find(15)).to eq(z)
    end
    it "should find a node to the left" do
      expect(tree.find(5)).to eq(x)
    end
  end
end
