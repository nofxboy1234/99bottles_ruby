class A
  def a_public_method
    a_private_method
  end

  private

  def a_private_method
    777
  end
end

class B < A
  def call_private_method
    a_private_method * 2
  end
end

puts A.new.a_public_method
puts B.new.call_private_method
