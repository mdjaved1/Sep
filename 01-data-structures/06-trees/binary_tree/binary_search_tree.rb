require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root 
    
  end

  def insert(root, node)
    if root.rating > node.rating 
      if root.left.nil?
        root.left = node 
      else
        insert(root.left,node)
      end
    else
      if root.right.nil?
        root.right = node
      else
        insert(root.right,node)
      end
    end
  end
  

  # Recursive Depth First Search
  def find(root, data)
    if root.nil?
      nil 
    elsif root.title == data
      return root 
    elsif root.right != nil 
      find(root.right , data)
    elsif root.left != nil 
      find(root.left ,data)
    end
  end

 
  
  
  def delete(root, data)
    node = find(root , data)
    if !node.nil?
        remove(node)
    end
  end
  
  def remove(node)
    
    if !node.left.nil? && node.right.nil?
      puts " about to set node left "
      node = node.left
      puts "node left set "
    elsif node.left.nil? && !node.right.nil?
      node = node.right
      puts" node right is not nil "
    elsif node.left.nil? && node.right.nil?
      puts "checking for nil "
      node = nil 
      return nil 
    else
      node = delete_node_with_two_children(node)
      puts"node with two child deleted "
    end
    node
  end
  
  def delete_node_with_two_children(node)
    min_node = find_min_node(node.right)
    replace_value(min_node, node)
    remove_min_node(min_node)
  end
  
  def find_min_node(node)
    if node.left.nil?
      min_node = node
      puts" min node found "
      return min_node
    else
      find_min_node(node.left)
    end
  end
  
  def replace_value(min_node,node)
    node.title = min_node.title
    node.rating = min_node.rating
  end
  
  def remove_min_node(min_node)
    min_node = nil 
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    if children == nil
      children = [@root]
    end
    arr = []
    children.each do |ele|
      puts "#{ele.title}: #{ele.rating}"
      arr << ele.left if ele.left != nil
      arr << ele.right if ele.right != nil
    end
    if arr.size == 0
      return nil
    else
      printf(arr)
    end
  end
end
