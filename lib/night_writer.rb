require './lib/night_read'
require 'pry'



    lines = File.open('message.txt', 'r')
    message = File.read(ARGV[0])
    characters_count = message.length
    letters = message.chars
    lines.close

    night_reader = NightRead.new(letters)

    writer = File.open(ARGV[1], 'w')
    
    #lines = File.new('braille.txt', 'w')
    #File.write(ARGV[1], message)

    puts "Created #{ARGV[1]} containing #{characters_count} characters"




    file_text = File.open(ARGV[0], 'r')
    incoming_english = file_text.read.delete("\n")
    file_text.close

    message = Translator.new(incoming_english)

    writer = File.open(ARGV[1], 'w')
    writer.write(message.braille_result)
    writer.close

       #puts "Created '#{ARGV[1]}' containing #{to_translate.strip.length} characters
      file_text = File.open(ARGV[0], 'r')
      incoming_english = file_text.read.delete("\n")
      file_text.close

      message = Translator.new(incoming_english)

      writer = File.open(ARGV[1], 'w')
      writer.write(message.braille_result)
      writer.close

       # puts "Created '#{ARGV[1]}' containing #{to_translate.strip.length} characters"
