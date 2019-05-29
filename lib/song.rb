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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    found_song ? found_song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    filename[1].slice!(".mp3")
    name = filename[1]
    artist_name = filename[0]
    song = self.new_by_name(name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    filename[1].slice!(".mp3")
    name = filename[1]
    artist_name = filename[0]
    song = self.create_by_name(name)
    song.artist_name = artist_name
    song
  end

  def destroy_all
    self.all.clears
  end
end
