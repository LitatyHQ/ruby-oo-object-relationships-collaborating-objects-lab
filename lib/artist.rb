class Artist

    attr_accessor :name
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      save
    end
  
    def add_song(song)
      @songs << song
      song.artist = self
    end 

    def songs
      Song.all.select {|song| song.artist == self}
    end
  
    def self.all
      @@all
    end

    def save
      @@all << self
    end
  
    def self.find_or_create_by_name(artist_name)
      self.all.find {|artist| artist.name == artist_name} || self.new(artist_name)
      # if found_artist
      #   found_artist
      # else
      #   new_artist.save
      #   new_artist
      # end
    end
  
    def print_songs
      @songs.each do |song|
        puts song.name
      end
    end
  
end
  