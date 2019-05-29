class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize
    @name = ""
    @artist_name = ""
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(n)
    song = self.create
    @name = n
  end

end
