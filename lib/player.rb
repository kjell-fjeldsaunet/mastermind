class Player
  attr_accessor :score, :name
  def initialize
    @score = 0
    @name = ''
  end

  def get_code(code_type)
    print "Please enter your #{code_type}: "
    code = gets.chomp.downcase
    until code.match?(/[rgbyop]{4}/) && code.size == 4
      print 'Invalid code! Please try again. Remember: Four letters, no space, no punctuation. '
      code = gets.chomp.downcase
    end
    code.chars
  end

  # ai_player.make_guess needs one parameter. To reuse code, we need to receive one parameter here as well.
  def make_guess(_placeholder, _placeholder2)
    get_code('guess')
  end

  def make_code
    get_code('secret code')
  end

  def ask_starting_role
    print "\n\nDo you want to start as CodeMaker[1] or CodeBreaker[2]? "
    role = gets.chomp
    until role.match?(/[1-2]/)
      puts 'Please enter 1 for CodeBreaker or 2 for CodeMaker'
      role = gets.chomp
    end
    role.to_i - 1
  end
end
