class Cli
  @@separator = "---------------------------------------------------------------------"

    def run


      puts "Welcome, This is a list latest release of Bollywood Music Albums. To know more about the songs and artists of that album, Please Select a number: "
      puts "#{@@separator} "
      Scraper.scrape_gaana
      display_albums
      menu
    end

    def display_albums
      Album.all.each.with_index(1) do |title, i|
      puts "#{i}. #{title.name}".colorize(:color => :light_blue, :background => :red)
      puts "\n"
      end
    end

    def menu
      puts "#{@@separator}"
      puts "Enter your number here: "
      input = gets.chomp

      album = Album.all[input.to_i - 1]

      if !album
        puts "This is not a correct option. \n Please select a valid option from a menu."
        display_albums
        menu
      else
        Scraper.scrape_songs(album)
          puts "Here are the details of album #{album.name}:"
          puts "\n"
        album.display_details.each do |song_hash|
          song_hash.each do |key, value|
            puts "#{key} : #{value}".colorize(:color => :black, :background => :white)
          end
          puts "\n"
        end
        choice
        #puts "#{album.display_details}"
      end
    end

    def choice
      puts "Would you like to see details of another album: (y/n)"
      input = gets.chomp
      if input == "y" || input == "Y"
        puts "Which Bollywood Album would you like to listen today?"
    #    Scraper.scrape_gaana
        display_albums
        menu
      else
        exit
      end
    end

end
