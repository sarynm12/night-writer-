require './lib/night_read'
#require './lib/night_reader'
require 'pry'
#ruby ./lib/night_writer.rb message.txt braille.txt


    #
    # lines = File.open('message.txt', 'r')
    # message = File.read(ARGV[0])
    # characters_count = message.length
    # letters = message.chars
    # lines.close
    #
    # night_reader = NightRead.new(letters)
    #
    # writer = File.open(ARGV[1], 'w')
    #
    # lines = File.new('braille.txt', 'w')
    # File.write(ARGV[1], message)
    #
    # puts "Created #{ARGV[1]} containing #{characters_count} characters"




 # ======== Enigma ======== #
    lines = File.open('message.txt', 'r')
    message = File.read(ARGV[0])
    characters_count = message.length
    letters = message.chars
    lines.close

    night_read = NightRead.new(letters)

    braille = night_read.translate_to_braille(letters)
    writer = File.open(ARGV[1], 'w')
    #writer.write
    # night_read.split_message
    # night_read.translate_to_braille
    writer.write(braille)

    writer.close

    puts "Created #{ARGV[1]} containing #{characters_count} characters"

    #incoming_message = handle.read
    #handle.close
    #
    # enigma = Enigma.new(incoming_message)
    # encrypted_text = enigma.encrypt
    #
    # writer = File.open(ARGV[1], "w")
    # writer.write(encrypted_text[:message])
    #
    # writer.close
    #
    # puts "Created #{ARGV[1]} with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
