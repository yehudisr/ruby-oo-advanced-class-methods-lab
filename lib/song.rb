require 'pry'

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
     self.all.detect {|s| s.name == name}
     
        
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
  end  

  def self.alphabetical
    self.all.sort_by {|song| song.name}
    #binding.pry
  end  

  def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name = parts[0]
      song_name = parts[1].gsub(".mp3", "")
      
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
  end 

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
  end

  def self.destroy_all
    self.all.clear
  end


  end

song1 = Song.new
song2 = Song.new
song4 = Song.new_by_name("Sally")
song3 = Song.find_by_name("sally")
song5 = Song.create_by_name("say no more")
song6 = Song.create_by_name("what are you")

# binding.pry
# 0