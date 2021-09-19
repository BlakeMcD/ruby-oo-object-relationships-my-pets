class Owner
  # code goes here

  @@all = []

  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  #Instance methods
  def say_species
    "I am a #{self.species}."
  end

  #Class methods
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  #Associations
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self} 
  end

  #Here I had it all wrong - I thought that you would be looking for a cat that already exists, but instead we are creating a new cat
  # def buy_cat(cat)
  #   about_to_buy = Cat.all.find { |cat_to_buy| cat_to_buy == cat }
  #   about_to_buy.owner = self
  # end
  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    owned_dogs = self.dogs
    owned_dogs.each {|dog| dog.mood = "happy"}
    # self.dogs.mood = "happy"
  end

  def feed_cats
    owned_cats = self.cats
    owned_cats.each {|cat| cat.mood = "happy"}
    # self.dogs.mood = "happy"
  end

  def sell_pets
    #change mood and owner
    self.dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil 
    end

    self.cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end