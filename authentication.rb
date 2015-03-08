def main_menu
  clear_screen
  print_menu

  case read_character_from_keyboard
  when "1"
    sign_in
  when "2"
    register_user
  when "X"
    exit_program
  else
    puts "Usage: 1, 2 or X"
  end
end

def sign_in
  clear_screen
  puts "User: "
  user = read_character_from_keyboard
  puts "Password: "
  password = read_character_from_keyboard

  if valid_credentials?(user, password)
    puts 'You have successfully signed in.'
  else
    puts 'Invalid credentials. Good bye.'
    exit_program
  end
end

def register_user
  clear_screen
  puts "User: "
  user = read_character_from_keyboard
  File.open('db/user.model', 'a') { |file| file.write(user); file.close }
  puts "Password: "
  password = read_character_from_keyboard
  encrypted_password = encrypt(password)
  File.open('db/password.model', 'a') { |file| file.write(encrypted_password); file.close }

  main_menu
end

def valid_credentials?(user, password)
  current_line = 0

  File.open('db/user.model', 'r').each_line do |user_from_file|
    password_from_file = File.readlines('db/password.model')[current_line]

    if user_from_file == user && decrypt(password_from_file) == password
      return true
    end

    current_line += 1
  end

  return false
end

def exit_program
  Kernel.exit(false)
end

def clear_screen
  system("clear")
end

def print_menu
  puts "Select option:"
  puts "(1) Sign in"
  puts "(2) Register user"
  puts "(X) Exit"
end

def read_character_from_keyboard
  gets.strip
end

# ===================
def encrypt(string)
  # Change me
  string
end

def decrypt(string)
  # Change me
  string
end
# ===================

main_menu