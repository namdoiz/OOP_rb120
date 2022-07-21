=begin
Modify the following code so that Hello! 
I'm a cat! is printed when Cat.generic_greeting is invoked.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
# the method calls below shoud output the same things
kitty.class.generic_greeting
Cat.generic_greeting