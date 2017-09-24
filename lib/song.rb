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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    s = self.new
    filename_arr = filename.split(" - ")
    #binding.pry
    s.name = filename_arr[1].chop.chop.chop.chop
    s.artist_name = filename_arr[0]
    s
  end

  def self.create_from_filename(filename)
    s = self.new
    filename_arr = filename.split(" - ")
    #binding.pry
    s.name = filename_arr[1].chop.chop.chop.chop
    s.artist_name = filename_arr[0]
    s.save
  end

  def self.destroy_all
    self.all.clear
  end
end
