require_relative '../lib/binaryheap'
require 'test/unit'

class TestTop < Test::Unit::TestCase
  def test1
    pq.push(3)
    pq.push(5)
    pq.push(7)
    expect(pq.top).to eq(3)
  end

  def test2
    expect(pq.top).to be_nil
  end

end