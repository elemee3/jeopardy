class Game
  attr_accessor :team1, :team2, :team3, :team4
  def initialize
    @team1 = ['', 0]
    @team2 = ['', 0]
    @team3 = ['', 0]
    @team4 = ['', 0]
  end

  def welcome
    puts "Welcome to Jeopardy"
    puts "Team 1, please enter your team name"
    @team1[0] = gets.chomp.upcase
    puts "Team 2, please enter your team name"
    @team2[0] = gets.chomp.upcase
    puts "Team 3, please enter your team name"
    @team3[0] = gets.chomp.upcase
    puts "Team 4, please enter your team name"
    @team4[0] = gets.chomp.upcase
    puts "Alright, #{@team1[0]}, #{@team2[0]}, #{@team3[0]}, and #{@team4[0]}...LET'S GET READY TO RUMBLE"
  end

  def display_points
    if @team1[1] + @team2[1] + @team3[1] + @team4[1] == 120
      game_message(true)
    else
      game_message(false)
    end
  end

  def game_message(is_win)
    teams = [@team1, @team2, @team3, @team4]
    if is_win
      sorted = teams.sort_by { |team| team[1] }
      puts "Congratulations, #{sorted.last[0]}, you win!!"
      teams.each do |team|
        puts "#{team[0]} finishes with #{team[1]} points"
      end
    else
      teams.each do |team|
        puts "#{team[0]} now has #{team[1]} points"
      end
    end
  end

  def get_points (arr)
    @team1[1] = arr[0]
    @team2[1] = arr[1]
    @team3[1] = arr[2]
    @team4[1] = arr[3]
  end

end

class GameBoard
  attr_accessor :movies, :us_trivia, :nature, :newgame
  def initialize
    @newgame = Game.new
    @team_points = [0,0,0,0]
    @movies = [
      ["According to Buddy the Elf, the four food groups are: candy, candy canes, candy corn, and...", ["A. Milk chocolate", "B. Peanut Butter", "C. Marshmallows", "D. Syrup"], "d"],
      ["The sounds made by the Brachiosaurus in Jurassic Park were a combination of what two sounds?", ["A. Cat and dog sounds", "B. Cow and emu sounds", "C. Crow and howler monkey sounds", "D. Donkey and whale sounds"], "d"],
      ["What is Bill Murray's occupation in Groundhog Day?", ["A. Meteorologist", "B. School teacher", "C. Dentist", "D. Salesperson"], 'a'],
      ["In Star Wars (original trilogy), who was the first character to speak?", ["A. Boba fett", "B. Obi-wan Kenobi", "C. Luke Skywalker", "D. C-3PO"], 'd']
    ]
    @us_trivia = [
      ["What U.S. state boasts the following rivers: the Guadalupe, Trinity, Rio Grande, Brazos, and Colorado?", ["A. California", "B. Oklahoma", "C. Colorado", "D. Texas"], 'd'],
      ["Pierre is the capital of what U.S. state?", ["A. Montana", "B. Wisconsin", "C. South Dakota", "D. Oregon"], 'c'],
      ["What is the longest river in the United States?", ["A. Amazon River", "B. Mississippi River", "C. Missouri River", "D. Colorado River"], 'c'],
      ["What is the deadliest job in America?", ["A. Coal miners", "B. Underwater welder", "C. Logging workers", "D. President of USA"], "d"]
    ]
    @nature = [
      ["What is a group of kangaroos called?", ["A. Gaggle", "B. Mob", "C. Gang", "D. Pack"], "b"],
      ["In which country did Christmas trees originate?", ["A. Germany", "B. Russia", "C. USA", "D. Canada"], "a"],
      ["Which non-human animal kills the most humans each year?", ["A. Sharks", "B. Birds", "C. Wolves", "D. Mosquitos"], "d"],
      ["Which galaxy is closest to our own?", ["A. Milky Way", "B. Andromeda", "C. Ursa Major", "D. Delta Quadrant"], "b"]
    ]
  end

  def display_riddle
    puts "What word begins and ends with an 'E' but only has one letter?"
    gets.chomp
    display_categories
  end

  def display_categories
    if (@movies.length > 0 || @us_trivia.length > 0 || @nature.length > 0)
      puts "Category A: Movies" if @movies.length > 0
      puts "Category B: US Trivia" if @us_trivia.length > 0
      puts "Category C: Nature" if @nature.length > 0
      puts
      puts "Which category would you like?"
      display_question
    else
      puts "Game Over"
    end
  end

  def handle_question(category)
      puts category[0][0] #name
      puts category[0][1] #question

      until get_answer(category)
      end

      puts "Which team answered correctly?"
      winner = gets.chomp.to_i

      category.shift
      @team_points[winner - 1] += 10
      @newgame.get_points(@team_points)
      @newgame.display_points
      display_categories()
  end

  def display_question
    category = gets.chomp.downcase
    puts
    if category == "a"
      handle_question(@movies)
    elsif category == "b"
      handle_question(@us_trivia)
    elsif category == "c"
      handle_question(@nature)
    else
      puts "Invalid Response, pick an available category"
    end

  end

  def get_answer (category)
    answer = gets.chomp
    if answer == category[0][2]
      puts
      puts "Bingo!"
      puts
      return true
      # remove question, add to team's score array
      # same team picks a new category
    else
      puts
      puts "Next team, now's your chance!"
      puts
      return false
      # different team gets a chance to answer
    end
  end


end



  game_board = GameBoard.new
  game_board.newgame.welcome
  puts
  game_board.display_riddle
  puts
  puts
  game_board.display_question
  puts
  puts



#First display all categories with available questions.  questions that were answered will be displayed with "x question x"
#once a team picks their category, it will display the question at index of 0.
#which team answered first... gets.chomp
#then their answer is entered
