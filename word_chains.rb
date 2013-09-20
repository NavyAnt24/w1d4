class TreeNode
  attr_accessor :parent, :word

  def initialize(parent,word)
    @parent = parent
    @word = word
  end

  def root?
    return true if parent == nil
    false
  end

  def distance_to_root
    if self.root?
      return 0
    else
      return 1 + @parent.distance_to_root
    end
  end

  def trace_path
    if self.root?
      return [@word]
    else
      return @parent.trace_path + [@word]
    end
  end
end

class String
  def adjacent?(word)
    mismatched_letters = 0
    self.split("").each_index do |index|
      mismatched_letters += 1 if self[index] != word[index]
    end
    return true if mismatched_letters == 1
    false
  end
end

def word_chain(word1, word2)
  dictionary = File.read('dictionary_no_hyphen.txt').split(' ')
  dictionary.select! { |word| word.length == word1.length }

  nodes = []
  nodes << TreeNode.new(nil, word1)
  node_index = 0

  until word_found?(word2, nodes)
    current_node = nodes[node_index]
    dictionary.each do |word|
      if current_node.word.adjacent?(word) && find_node(word, nodes).nil?
        nodes << TreeNode.new(current_node, word)
        #puts word
      end
    end
    node_index += 1
    printf "."
    raise "ran out of nodes" if node_index >= nodes.length
  end

  printf "\n"
  path = find_node(word2, nodes).trace_path
  path.each { |word| puts word }
  puts "Shortest path: #{find_node(word2, nodes).distance_to_root} steps."
end

def word_found?(keyword, nodes)
  nodes.each do |node|
    return true if keyword == node.word
  end
  false
end

def find_node(keyword, nodes)
  nodes.each do |node|
    return node if keyword == node.word
  end
  nil
end

dictionary = File.read('dictionary_no_hyphen.txt').split(' ')
dictionary.select! { |word| word.length == 5 }
while true
  a = dictionary.sample
  b = dictionary.sample
  puts a
  puts b
  word_chain(a, b)
end