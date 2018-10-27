class Game
  attr_accessor :team1, :team2, :team3, :team4
  def initialize
    @team1 = ['', 0]
    @team2 = ['', 0]
    @team3 = ['', 0]
    @team4 = ['', 0]
  end
  def welcome
    puts
    puts
    puts "Welcome to Jeopardy"
    puts "Team 1, please enter your team name"
     @team1[0] = gets.chomp.upcase
    puts "Team 2, please enter your team name"
     @team2[0] = gets.chomp.upcase
    puts "Team 3, please enter your team name"
     @team3[0] = gets.chomp.upcase
    puts "Team 4, please enter your team name"
     @team4[0] = gets.chomp.upcase
     puts
     puts
    puts "Alright, #{@team1[0]}, #{@team2[0]}, #{@team3[0]}, and #{@team4[0]}...LET'S GET READY TO RUMBLE"
    puts
  end

  def display_points
    if @team1[1] + @team2[1] + @team3[1] + @team4[1] == 120
      # winner_arr = [@team1, @team2, @team3, @team4]
        if @team1[1] > @team2[1] && @team1[1] > @team3[1] && @team1[1] > @team4[1]
          puts "Congratulations, #{@team1[0]} WINS!"
        elsif @team2[1] > @team1[1] && @team2[1] > @team3[1] && @team2[1] > @team4[1]
          puts "Congratulations, #{@team2[0]} WINS!"
        elsif @team3[1] > @team2[1] && @team3[1] > @team1[1] && @team3[1] > @team4[1]
          puts "Congratulations, #{@team3[0]} WINS!"
        elsif @team4[1] > @team2[1] && @team4[1] > @team3[1] && @team4[1] > @team1[1]
          puts "Congratulations, #{@team4[0]} WINS!"

        end
    else
      puts "#{@team1[0]} now has #{@team1[1]} points"
      puts "#{@team2[0]} now has #{@team2[1]} points"
      puts "#{@team3[0]} now has #{@team3[1]} points"
      puts "#{@team4[0]} now has #{@team4[1]} points"
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
    @movies = [["According to Buddy the Elf, the four food groups are: candy, candy canes, candy corn, and...", ["A. Milk chocolate", "B. Peanut Butter", "C. Marshmallows", "D. Syrup"], "d"],
    ["The sounds made by the Brachiosaurus in Jurassic Park were a combination of what two sounds?", ["A. Cat and dog sounds", "B. Cow and emu sounds", "C. Crow and howler monkey sounds", "D. Donkey and whale sounds"], "d"],
    ["What is Bill Murray's occupation in Groundhog Day?", ["A. Meteorologist", "B. School teacher", "C. Dentist", "D. Salesperson"], 'a'],
    ["In Star Wars (original trilogy), who was the first character to speak?", ["A. Boba fett", "B. Obi-wan Kenobi", "C. Luke Skywalker", "D. C-3PO"], 'd']
  ]
    @us_trivia = [["What U.S. state boasts the following rivers: the Guadalupe, Trinity, Rio Grande, Brazos, and Colorado?", ["A. California", "B. Oklahoma", "C. Colorado", "D. Texas"], 'd'],
    ["Pierre is the capital of what U.S. state?", ["A. Montana", "B. Wisconsin", "C. South Dakota", "D. Oregon"], 'c'],
    ["What is the longest river in the United States?", ["A. Amazon River", "B. Mississippi River", "C. Missouri River", "D. Colorado River"], 'c'],
    ["What is the deadliest job in America?", ["A. Coal miners", "B. Underwater welder", "C. Logging workers", "D. President of USA"], "d"]
  ]
    @nature = [["What is a group of kangaroos called?", ["A. Gaggle", "B. Mob", "C. Gang", "D. Pack"], "b"],
               ["In which country did Christmas trees originate?", ["A. Germany", "B. Russia", "C. USA", "D. Canada"], "a"],
               ["Which non-human animal kills the most humans each year?", ["A. Sharks", "B. Birds", "C. Wolves", "D. Mosquitos"], "d"],
               ["Which galaxy is closest to our own?", ["A. Milky Way", "B. Andromeda", "C. Ursa Major", "D. Delta Quadrant"], "b"]]
    @team_points= [0,0,0,0]
    @newgame = Game.new
  end
  def display_riddle
    puts
    puts "What word begins and ends with an 'E' but only has one letter?"
    puts
    gets.chomp
    display_categories
  end

  def display_categories
    if (@movies.length > 0 || @us_trivia.length > 0 || @nature.length > 0)
      puts "Category A: Movies" if @movies.length > 0
      puts "Category B: US trivia" if @us_trivia.length > 0
      puts "Category C: Nature" if @nature.length > 0
      puts
      puts "Which category would you like?"
      puts
      display_question
    else
      puts "Game Over"
    end
  end
  #
  # def display_winner
  #   winner_arr = [@newgame.team1[1], @newgame.team2[1], @newgame.team3[1], @newgame.team4[1]]
  #   true_winner =[]
  #   winner_arr.each do |team|
  #     if team.length < 1
  #       true_winner << team
  #     end
  #   end
  #   true_winner.sort_by {|team| team.length}
  #   puts "Congratulations #{true_winner.last[0]}"
  # end


  def display_question
    category = gets.chomp.downcase
    puts

    if category == "a"
      puts @movies[0][0]
      puts @movies[0][1]
      puts
      until get_answer(@movies)
      end
      puts "Which team answered correctly?"
      winner = gets.chomp.to_i
      @movies.shift
      @team_points[winner - 1] += 10
      puts
      @newgame.get_points(@team_points)
      @newgame.display_points
      puts
      puts
      display_categories()
    elsif category == "b"
      puts @us_trivia[0][0]
      puts @us_trivia[0][1]
      puts
      until get_answer(@us_trivia)
      end
      puts "Which team answered correctly?"
      winner = gets.chomp.to_i
      @us_trivia.shift
      @team_points[winner - 1] += 10
      puts
      @newgame.get_points(@team_points)
      @newgame.display_points
      puts
      puts
      display_categories()
    elsif category == "c"
      puts @nature[0][0]
      puts @nature[0][1]
      puts
      until get_answer(@nature)
      end
      puts "Which team answered correctly?"
      winner = gets.chomp.to_i
      @nature.shift
      @team_points[winner - 1] += 10
      puts
      @newgame.get_points(@team_points)
      @newgame.display_points
      puts
      puts
      display_categories()
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
