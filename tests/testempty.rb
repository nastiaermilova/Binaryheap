require_relative '../lib/binaryheap'
require 'test/unit'

class TestEmpty < Test::Unit::TestCase
  def test1
    expect(pq.empty?).to be true
  end

  def test2
    pq.push(5)
    expect(pq.empty?).to be false
  end

end