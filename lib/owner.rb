require "pry"

class Owner
  attr_accessor :pets
  attr_reader :name, :species #can't change owner's name, species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    # @cats = []
    # @dogs = []
    @pets = {:cats => [], :dogs => []}
  end

  def say_species
    "I am a #{@species}." # not puts
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    # @cats << Cat.new(cat_name, self)
    @pets[:cats] << Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    # @dogs << Dog.new(dog_name, self)
    @pets[:dogs] << Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each do |dog|
      dog.mood = "nervous"
      dog.remove_instance_variable(:@owner)
    end

    # binding.pry
    cats.each do |cat|
      cat.mood = "nervous"
      cat.remove_instance_variable(:@owner)
    end
  end

  # def sell_pets
  #   pets.collect do |species, instances|
  #     instances.each do |pet|
  #       pet.mood = "nervous"
  #     end
  #     instances.clear
  #   end
  # end

  def list_pets
  end
end
