class Person

  attr_reader :name
  def name
	@name
  end

  attr_writer :name
  def name=(name)
	@name=name
  end

  attr_accessor :name
  def name
	@name
  end

  def name=(name)
	@name = name
  end

end

person = Person.new
person.name= "Nancy"
puts person.name

john = Person.new
john.name=("John")
puts john.name
