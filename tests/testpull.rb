require_relative '../lib/binaryheap'
require 'test/unit'

class TestPull < Test::Unit::TestCase
  def test1
    pq.push(3)
    pq.push(5)
    pq.push(7)
    expect(pq.pop).to eq(3)
    expect(pq.size).to eq(2)
  end

  def test2
    expect(pq.pop).to be_nil
  end

end