require './lib/dictionary'


    lines = File.open('message.txt', 'r')
    message = File.read(ARGV[0])
    characters_count = message.length
    letters = message.chars
    lines.close

    lines = File.new('braille.txt', 'w')
    File.write(ARGV[1], message)

    puts "Created #{ARGV[1]} containing #{characters_count} characters"
