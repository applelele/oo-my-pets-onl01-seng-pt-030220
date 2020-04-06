class Dog
  attr_accessor :owner, :mood
  attr_reader :name  #can't change its name

  @@all = []

  def initialize(name, owner_name)
    @name = name
    self.owner = owner_name # cat.owner.name
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  # def buy_dog(new_owner)
  #   # self.owner = new_owner
  #   dog.mood = "hungry"
  # end

end
