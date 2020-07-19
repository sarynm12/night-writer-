require './lib/braille'

# class NightWriter
#   attr_reader :content

  #def read_and_write_contents
    braille = Braille.new

    lines = File.open('message.txt', 'r')
    content = File.read(ARGV[0])
    characters_count = content.length
    braille.translate(content)
    lines.close

    lines = File.new('braille.txt', 'w')
    #File.write(ARGV[1], content)

    puts "Created #{ARGV[1]} containing #{characters_count} characters"

  #end
#
NightWriter.new.read_and_write_contents
