require './lib/night_writer'

input = File.open(ARGV[0], 'r')
contents = input.read
input.close



# output_text = contents.format_braille_output
# File.write(ARGV[1], output_text)
#
# puts "Created '#{ARGV[1]}' containing #{output_text.size} characters."

# message = File.open('message.txt', 'r')
# input = message.read
# message.close



# enigma = Enigma.new(incoming_message)
# encrypted_text = enigma.encrypt
#
# writer = File.open(ARGV[1], "w")
# writer.write(encrypted_text[:message])
#
# writer.close
#
# puts "Created #{ARGV[1]} with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
