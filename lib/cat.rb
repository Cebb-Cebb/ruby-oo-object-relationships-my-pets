class Cat

  attr_accessor :mood, :owner
  attr_reader :name# code goes here

  @@cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@cats << self
  end

  def self.all
    @@cats
  end


end