class Pet
  attr_reader :name, :animal
  def initialize(animal, name)
    @name = name
    @animal = animal
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets
  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
  
end

class Shelter
  @@adoptions = Hash.new

  def adopt(adopter, adopted)
    @@adoptions[[adopted.animal, adopted.name]] = [adopter.name]
    adopter.number_of_pets += 1
  end

  def print_adoptions
    @@adoptions.values.uniq.each do |human|
      puts "#{human[0]} has adopted the following pets:"
      pets = @@adoptions.select{|k, v| v == human}
      pets.keys.each do |arr|
        puts "a #{arr[0]} named #{arr[1]}"
      end
      puts " "
    end
  end
end

=begin
  -  @@adoptions[adopted.animal, adopted.name] = [adopter.name]
    - for each adopter's name in the hash (value),
        say the name has adopted the followiing pets
        then select the keys(pets) in the hash that have
        their values set to the same adopter name
          - for each of these keys
            print "a adopted[0] named adopted[1]"

=end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."