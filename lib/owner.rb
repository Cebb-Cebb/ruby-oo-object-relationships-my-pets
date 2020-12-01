require 'pry'
class Owner
  attr_accessor :pets, :cat
  attr_reader :species, :name  

  @@all = []

  def initialize(name, species= "human")
     @name = name 
     @species = species
     @pets = {:cats => [], :dogs => []}
     @@all << self 
  end


  def say_species
    "I am a #{@species}."
  end 
    
  def self.all
    @@all
  end 

  def self.count
    @@all.size 
  end 

  def self.reset_all
    @@all.clear
  end 

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs
    Dog.all.select {|dog| dog.owner == self}
    # binding.pry   
  end 

  def buy_cat(name)
    pets[:cats] << Cat.new(name, self)
  end 
    
  def buy_dog(name)
    pets[:dogs] << Dog.new(name, self)
  end 

  def walk_dogs
    self.dogs.select {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    self.cats.select {|cat| cat.mood = "happy"}
  end 

  def sell_pets
    self.dogs.select {|dog| dog.mood = "nervous"}
    self.cats.select {|cat| cat.mood = "nervous"}
    self.dogs.select {|dog| dog.owner = nil}
    self.cats.select {|cat| cat.owner = nil}
  end 

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 




  
end