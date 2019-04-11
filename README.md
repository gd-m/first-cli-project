created a directory 'Gaana' through command prompt
then created another directories 'bin' and 'lib'
created executable file album in 'bin' through command prompt (command echo. 2> album) and 'cli.rb'

tested if the album file is running

connected cli.rb file to album and then ran the album file to check if the code in cli.rb is getting executed.

then i stated adding gem names and put a url to open to parse through nokogiri.
got two errors when ran the album file . cannot load nokogiri and pry.
these gems aren't installed in my computer.
so i have to setup a local environment.

i installed bundler.
then created Gemfile through bundler init command.
added gems which are required to complete this project.
i.e.
1. nokogiri
2. open-uri
3. pry
extra gems
4.rspec
