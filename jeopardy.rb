class Game
  attr_accessor :team1, :team2, :team3, :team4
  def initialize
    @team1 = ""
    @team2 = ""
    @team3 = ""
    @team4 = ""
  end
  def welcome
    puts "Welcome to Jeopardy"
    puts "Team 1, please enter your team name"
     @team1 = gets.chomp
    puts "Team 2, please enter your team name"
     @team2 = gets.chomp
    puts "Team 3, please enter your team name"
     @team3 = gets.chomp
    puts "Team 4, please enter your team name"
     @team4 = gets.chomp
    puts "Alright, #{@team1}, #{@team2}, #{@team3}, #{@team4}...GET READY TO RUMBLE"
  end
end

class GameBoard
  attr_accessor :movies, :code, :nature
  def initialize
    @movies = ["movies"]
    @code = ["code question"]
    @nature = [["What is a group of kangaroos called?", ["A. Gaggle", "B. Mob", "C. Gang", "D. Pack"], "b"]]
    @current_team = ""
  end


  def display_categories
    puts "Category A: Movies"
    puts "Category B: Code"
    puts "Category C: Nature"
    puts "Which category would you like?"
  end

  def display_question
    category = gets.chomp.downcase
    puts
    if category == "a"
      puts @movies[0]
      until get_answer(@movies)
      end
    elsif category == "b"
      puts @code[0]
      until get_answer(@code)
      end
      @current_team << @code.shift
    elsif category == "c"
      puts @nature[0][0]
      puts @nature[0][1]
      # puts @nature[0][1]
      until get_answer(@nature)
      end
      @current_team << @nature.shift
      puts @current_team.length
    else
      puts "Invalid Response"
    end

  end

  def get_answer (category)
    answer = gets.chomp
    if answer == category[0][2]
      puts "correct"
      return true
      # remove question, add to team's score array
      # same team picks a new category
    else
      puts "go again"
      return false
      # different team gets a chance to answer
    end
  end


end


  newgame = Game.new
  game_board = GameBoard.new
  newgame.welcome
  puts
  puts
  game_board.display_categories
  puts
  puts
  game_board.display_question
  puts
  puts



#First display all categories with available questions.  questions that were answered will be displayed with "x question x"
#once a team picks their category, it will display the question at index of 0.
#which team answered first... gets.chomp
#then their answer is entered
