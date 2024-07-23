# frozen_string_literal: true

require_relative 'validator'

module UI
  def self.display_logo
    logo = <<~LOGO
      #{'                                                                       '}
      ░▒▓███████▓▒░  ░▒▓███████▓▒░   ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      ░▒▓███████▓▒░  ░▒▓███████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░   ░▒▓██████▓▒░#{'  '}
      ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░#{' '}
      #{'                                                                           '}
      #{'                                                                           '}

    LOGO
    puts logo
  end

  def self.render_line
    puts '--------------------------'
  end

  def self.display_message(message)
    puts "--------#{message}--------"
  end

  def self.prompt(message)
    print "--------#{message}--------\n> "
    gets.chomp
  end

  def self.prompt_for_int(message, min: nil, max: nil)
    loop do
      input = prompt(message)
      if Validator.valid_integer?(input, min: min, max: max)
        return input.to_i
      else
        display_message("Invalid input. Please enter a valid number between #{min} and #{max}.")
      end
    end
  end

  def self.empty_line
    puts
  end
end
