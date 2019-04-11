#require 'nokogiri'
#require 'open-uri'
#require_relative "albums.rb"

class Scraper
  GAANA = "https://gaana.com"

  def self.scrape_gaana
    html = open(GAANA)
    doc = Nokogiri::HTML(html)

    doc.css(".card_layout")[2].css(".card_layout_data").each do |album|
      url = album.css(".arwtork_label a").attr("href").value
      album_name = album.css(".arwtork_label").css(".album-name").text.strip
      album = Album.new(album_name, url)
      album.save
    end
  end

  def self.scrape_songs(album)
    album_details = []


    html = open(GAANA + album.url)
    doc = Nokogiri::HTML(html)
    doc.css(".s_c").css(".s_l .artworkload").each do|song|
        song_name = song.css(".track_npqitemdetail span").text
        artist = song.css(".track_npqitemdetail p").text.split('-')[1].strip
        album_hash = {}
        album_hash["Song"] = song_name
        album_hash["Artists"] = artist
        album.save_details(album_hash)
      end



    #album_details.each.with_index(1) do |title, i|
    #    puts "#{i}. #{title}"
    #  end

  end
end
