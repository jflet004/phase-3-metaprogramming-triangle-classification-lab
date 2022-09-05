require "pry"

class Triangle

  attr_reader :l1, :l2, :l3

  def initialize (l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end
  
  def kind

    triangle_validation

    if l1 == l2 && l2 == l3
      :equilateral
    elsif l1 == l2 || l2 == l3 || l1 == l3
      :isosceles
    else
      :scalene
    end
  end
  
  def triangle_validation
    raise TriangleError unless no_size? && triangle_inequality?
  end

  def no_size?
    [l1, l2, l3].all?{|length| length.positive?}
  end

  def triangle_inequality?
    l1 + l2 > l3 && l2 + l3 > l1 && l1 + l3 > l2
  end

  class TriangleError < StandardError
  end

end
