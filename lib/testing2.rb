class Person
  def a_public_method_that_sends_private_message
    weight
  end

  private

  attr_reader :weight

  def initialize
    @weight = 5
  end

  # def self.inherited(subclass)
  #   subclass.send :undef_method, :weight
  # end

  def another_private_method(a, b)
    "another_private_method: a = #{a}, b = #{b}"
  end
end

class Spy < Person
  private

  attr_accessor :code

  public

  def test
    weight
  end
end

# puts Person.new.send(:weight) # => 5
# puts Person.new.send(:another_private_method, 3, 4)
# puts Person.new.a_public_method_that_sends_private_message

# puts Spy.new.send(:weight) #=> Unhelpful undefined method error
puts Spy.new.test
# puts Spy.new.weight
