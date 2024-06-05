require_relative '../lib/binaryheap'
require 'test/unit'

class TestPush < Test::Unit::TestCase
  def test1
    pq.push(5)
    expect(pq.size).to eq(1)
    expect(pq.top).to eq(5)
  end

  def test2
    pq.push(3)
    pq.push(5)
    pq.push(7)
    expect(pq.size).to eq(3)
    expect(pq.top).to eq(3)
  end

  def test3
    pq.push(7)
    pq.push(5)
    pq.push(3)
    expect(pq.size).to eq(3)
    expect(pq.top).to eq(3)
  end

end