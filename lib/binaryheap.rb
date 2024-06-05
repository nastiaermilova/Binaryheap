require 'pty'

class PriorityQueueHeap
  def initialize
    @data = []
  end

  def push(value)
    @data << value
    heapify_up
  end

  def pop
    return if @data.empty?

    @data[0], @data[-1] = @data[-1], @data[0]
    @data.pop
    heapify_down(0)
  end

  def top
    raise "PriorityQueue is empty" if @data.empty?

    @data.first
  end

  def empty?
    @data.empty?
  end

  def size
    @data.size
  end

  def merge(other)
    other.data.each { |value| push(value) }
  end

  def assign(array)
    @data = array
    (@data.size / 2 - 1).downto(0) { |i| heapify_down(i) }
  end

  def to_s
    @data.join(' ')
  end

  private

  def heapify_up
    index = @data.size - 1
    while index > 0
      parent = (index - 1) / 2
      if @data[index] < @data[parent]
        @data[index], @data[parent] = @data[parent], @data[index]
        index = parent
      else
        break
      end
    end
  end

  def heapify_down(index)
    while (left_child = 2 * index + 1) < @data.size
      right_child = left_child + 1
      min_child = right_child < @data.size && @data[right_child] < @data[left_child] ? right_child : left_child
      if @data[min_child] < @data[index]
        @data[index], @data[min_child] = @data[min_child], @data[index]
        index = min_child
      else
        break
      end
    end
  end
end

def read_words_from_file(filename, words, pq)
  File.open(filename, "r") do |file|
    file.each_line do |line|
      line.split.each do |word|
        words << word
        pq.push(word)
      end
    end
  rescue Errno::ENOENT => e
    puts "Error opening file: #{e.message}"
  end
end
