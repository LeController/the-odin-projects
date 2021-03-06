class LinkedList 
  def initialize
    @linked_list = []
  end

  def list
    return @linked_list
  end

  def append(value)
    end_node = Node.new(value)
    @linked_list.push(end_node)
    if @linked_list.length > 1
      @linked_list[-2].change_node(end_node)
    end
  end

  def prepend(value)
    @linked_list.unshift(Node.new(value))
    if @linked_list.length > 1
      @linked_list[0..-2].each_with_index do |node, index|
        node.change_node(@linked_list[index+1])
      end
    end
  end

  def size
    return @linked_list.length
  end

  def head 
    return @linked_list[0]
  end

  def tail 
    return @linked_list[-1]
  end

  def at(index)
    if @linked_list.size < index-1
      return "NODE DOES NOT EXIST"
    else
      return @linked_list[index]
    end
  end

  def pop
    @linked_list.pop
    if @linked_list.size > 0
      @linked_list[-1].change_node(nil)
    end
  end

  def contains?(value)
    @linked_list.each do |node|
      if node.value == value
        return true
      end
    end
    return false
  end

  def find(value)
    @linked_list.each_with_index do |node, index|
      if node.value == value
        return index
      end
    end
    return nil
  end
  
  def to_s
    str = ""
    @linked_list.each do |node|
      str.concat("( #{node.value} ) -> ")
    end
    return str.concat("nil")
  end

  def insert_at(value, index)
    @linked_list.insert(index, Node.new(value))
    if @linked_list.length > 1
      @linked_list[index-1..-2].each_with_index do |node, index2|
        node.change_node(@linked_list[index2+index])
      end
    end
    @linked_list[-1].change_node(nil)
  end

  def remove_at(index)
    @linked_list.delete_at(index)
    if @linked_list.length > 1
      @linked_list[index-1..-2].each_with_index do |node, index2|
        node.change_node(@linked_list[index2+index])
      end
    end
    @linked_list[-1].change_node(nil)
  end
end


class Node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end

  def value
    return @value
  end

  def next_node
    return @next_node
  end

  def change_node(new_node)
    @next_node = new_node
  end
end


# list1 = LinkedList.new()

# list1.append(4)
# list1.append(8)
# list1.append(12)
# list1.prepend(0)
# list1.prepend(6)

# p list1.list

# p list1.size

# p list1.contains?(0)

# p list1.to_s

# list1.insert_at(56, 3)

# p list1.to_s

# list1.remove_at(3)

# p list1.to_s