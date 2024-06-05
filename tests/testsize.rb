require_relative '../lib/binaryheap'
require 'test/unit'

class TestSize < Test::Unit::TestCase
  def test1
    expect(pq.size).to eq(0)
  end

  def test2
    pq.push(3)
    pq.push(5)
    pq.push(7)
    expect(pq.size).to eq(3)
  end

end