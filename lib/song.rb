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
    song = Song.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end 

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end 

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical
    self.all.sort_by { |name| name.name }
  end 

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    artist_name = split_filename[0]
    name = split_filename[1].gsub('.mp3', '')
    # "Thundercat - For Love I Come.mp3")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    split_filename = filename.split(' - ')
    artist_name = split_filename[0]
    name = split_filename[1].gsub('.mp3', '')

    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end 

  def self.destroy_all
    self.all.clear
  end
  
end
