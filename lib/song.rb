class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new.save
    self
  end

  def self.new_by_name(name)
    song = self.create
    #self.name = name
  end

end
