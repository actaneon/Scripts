#!/usr/local/bin/ruby
require 'fileutils'
require 'htmlentities'

class MP3Manager
    def initialize
	@items = Array.new
	@files = Array.new
    end

    def load_library
	data = IO.read("/Users/jking/Music/iTunes/iTunes Music Library.xml", encoding: 'UTF-8')

	lines = data.split("\n")
	lines.each do |line|
	    if line =~ /<string>file:\/\/localhost(.*\.mp3)?\<\/string>/
		@items.push decode_url($1)
	    end
	end
    end

    def load_files
	@files = Dir['/Users/jking/Music/iTunes/iTunes Music/**/*.mp3']
    end

    def check_library
	#diff = @files - @items
	diff = (@items | @files) - (@items & @files)
	diff.sort!

	diff.each do |item|
	    puts item
	end
    end

    def url_unescape(string)
	string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
	    [$1.delete('%')].pack('H*')
	end
    end

    def url_escape(string)
	string.gsub(/([^ a-zA-Z0-9_.-]+)/n) do
	    '%' + $1.unpack('H2' * $1.size).join('%').upcase
	end.tr(' ', '+')
    end

    def decode_url(file)
	coder = HTMLEntities.new

	file = url_unescape(file)
	file = coder.decode(file)

	file
    end

    def delete_file(file)
	FileUtils.move(file, "/Users/jking/.Trash/")
    end

end

x = MP3Manager.new
x.load_library
x.load_files
x.check_library
