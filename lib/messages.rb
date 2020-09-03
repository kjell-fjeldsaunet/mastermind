# frozen_string_literal: true

# Module that holds instructions and other messages
module Messages
  def welcome
    "\n\n Welcome to Mastermind! \n ---------------------\n\n"
  end

  def instructions
    'Mastermind is game where two players face off in a codebreaking challenge. '\
    'One player plays the role of CodeMaker(CM), the other will play as CodeBreaker(CB). '\
    'The CM can choose from six possible colors and will create a code consisting of four colors in a certain order. '\
    "The CB gets 12 attempts to guess the code. \n\n"\
    'The CB is told how many exact matches(correct color and position) and correct colors there are in the guess. '\
    'But they are not told which color is an exact match or correct color or just wrong. '\
    'The CB will continue to guess until they have used all their guesses, or until they get the code right. '\
    'The CM is awarded points for each guess, and a bonus point if the CB uses all 12 guesses. '\
    'for the next round, the roles of CB and CM are switched.'
  end

  def valid_code
    "\nA valid code consists of four letters representing each color in the code with no spaces between them. "\
    "The possible letters are 'r', 'g', 'b', 'y', 'o', and 'p' for red, green, blue, yellow, orange, and purple.\n\n"
  end

  def ask_name
    "\nWhat is your name? "
  end

  def play_again
    "\n\nDo you want to play another game of Mastermind? ['yes'/'no']: "
  end
end
