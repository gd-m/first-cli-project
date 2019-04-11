class Album
  attr_accessor :album, :album_name, :url, :album_details

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @album_details = []
  end
  def name
    @name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
  
  def save_details(hash)
    @album_details << hash
  end

  def display_details
    @album_details
  end

end
