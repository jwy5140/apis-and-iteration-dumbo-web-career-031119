def welcome
  puts "Good day!"
  puts "Welcome to Star Wars Character Reference!"
end

def get_character_from_user
  puts "Please enter a character name."
  character = gets.chomp
  return character.downcase
end

