require 'pry'
class Owner
  attr_accessor 
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
    cats
  end

  def buy_dog(name)
    Dog.new(name, self)
    dogs
  end

  def walk_dogs
    #binding.pry
    dog = Dog.all.select {|dog| dog.owner == self}
    dog.each {|dog| dog.mood = "happy"}
    dogs
  end

  def feed_cats
    cat = Cat.all.select {|cat| cat.owner == self}
    cat.each {|cat| cat.mood = "happy"}
    cats 
  end

  def sell_pets
    dog = Dog.all.select {|dog| dog.owner == self}
    cat = Cat.all.select {|cat| cat.owner == self}
    dog.each {|dog| dog.mood = "nervous"}
    cat.each {|cat| cat.mood = "nervous"}
    dog.each {|dog| dog.owner = nil}
    cat.each {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end