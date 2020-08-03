require './lib/translator'
require 'pry'
#ruby ./lib/night_writer.rb message.txt braille.txt

  lines = File.open('message.txt', 'r')
  message = File.read(ARGV[0])
  characters_count = message.length
  lines.close

  translator = Translator.new(message)

  braille = translator.braille_output

  writer = File.open(ARGV[1], 'w')

  writer.write(braille)

  writer.close

  puts "Created #{ARGV[1]} containing #{characters_count} characters"
