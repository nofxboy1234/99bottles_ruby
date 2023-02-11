class A
  # def self.inherited(subclass)
  #   subclass.send :undef_method, :a_private_method
  # end

  def a_public_method
    p self
    a_private_method
  end

  private

  def a_private_method
    777
  end
end

class B < A
  def a_public_method
    super
    144
  end
end

puts A.new.a_public_method
puts B.new.a_public_method

# // Online C++ compiler to run C++ program
# // https://www.programiz.com/cpp-programming/online-compiler/
# #include <iostream>

# class A {
#     public:

#     virtual int a_public_method() const { std::cout << typeid(this).name(); return a_private_method(); }

#     private:

#     virtual int a_private_method() const { return 777; }

# };

# class B : public A {
#     public:

#      int a_public_method() const override { A::a_public_method(); return 144; }

#      // error: 'virtual int A::a_private_method() const' is private within this context
#     //  void a_public_method_call_private_directly() const { a_private_method() }

#     private:
# };

# int main() {
#     // Write C++ code here
#     A a;
#     std::cout << a.a_public_method() << "\n";
#     B b;
#     std::cout << b.a_public_method() << "\n";

#     return 0;
# }
