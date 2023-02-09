class A
  attr_accessor :age
  # attr_accessor :secret
  
  def self.count
    puts 'count!'
  end

  # private_class_method :count
  count
  self.count
  A.count
  # B.count

  def initialize(age)
    @age = age
    @secret = 'secret'
    A.count
  end
  
  private
  
  def not_so_private_method
    puts 'private!'
  end
  
  protected
  
  def a_protected_method
    puts 'protected!'
  end

  public

  def whats_my_age_again(age)
    puts age
    puts self.age
    puts "#{@secret} from base class" # works
  end
end

class B < A
  count
  self.count
  A.count
  B.count

  def initialize(age)
    super
    puts "#{@secret} from subclass"
    # A.count
  end
  
  def test_private
    not_so_private_method # works
    self.not_so_private_method # works
  
    # b = self
    # b.not_so_private_method # Does not work

    # A.count
    # B.count

  end
  
  def test_protected
    a_protected_method
    self.a_protected_method
    
    c = self
    c.a_protected_method
  end

  def testing
    
  end
end

class C < B
  def test
    not_so_private_method
  end
end

foo = A.new(19)
# foo.test_private # Only available in subclass B
foo.send :not_so_private_method # works
# foo.not_so_private_method # Does not work

# foo.a_protected_method # Does not work

bar = B.new(20)
p bar.age
bar.whats_my_age_again(23)
bar.test_private
bar.test_protected


# bar.count

# puts "#{bar.secret} from outside" # Only works with attr_accessor :secret in A

# A.count
# B.count

c = C.new(88)
c.test




# class Person
#   def initialize(age)
#     @age = age
#   end

#   def older?(other_person)
#     age > other_person.age
#   end

#   protected # Works
#   # private # Does not work

#   attr_reader :age
# end

# malory = Person.new(64)
# sterling = Person.new(42)

# malory.older?(sterling)  # => true
# sterling.older?(malory)  # => false

# # malory.age
#   # => NoMethodError: protected method `age' called for #<Person: @age=64>