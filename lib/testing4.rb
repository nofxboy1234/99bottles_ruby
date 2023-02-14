class A
  def self.hello
    'hello'
  end

  puts A.hello

  private_class_method :hello

  def hello
    A.hello
  end
end

class B < A
end

# a = A.new
# puts a.hello

# puts A.hello

# b = B.new
# puts b.hello

# puts B.hello
