# Example provided by instructor

class Suspect
   attr_reader :name, :hair_color, :gender, :eye_color, :skin_color
 
   def initialize(record)
     attributes = record.split
     @name = attributes[0]
     @hair_color = attributes[1]
     @gender = attributes[2]
     @eye_color = attributes[3]
     @skin_color = attributes[4]
   end
 end
 
 
 class GuessWho
    attr_reader :suspects, :chosen_one
    attr_accessor :guess_count
 
    def initialize
      @guess_count = 3
      play_game
    end

    private

    def create_suspects
      @suspects = []
      file = File.open("suspects.txt")

      file.each_line do |record|
        suspects << Suspect.new(record)
      end

      file.close
    end
    
    def set_chosen_one
      @chosen_one = suspects.shuffle.last
    end

    def play_game
      create_suspects
      set_chosen_one
      start_game
    end

    def start_game
      puts "Welcome To Guess Who"
      print_list_of_suspects
      
      while true do
        if guess_count > 0
          puts "You can choose what attribute to guess by typing hair, gender, eye, or"
          puts "skin. You will be prompted to take a guess. You can exit now by typing exit:"
          
          choice = gets.chomp.downcase
          
          return false if choice == "exit" or ask_questions(choice) == false
        else
          puts "You lose! You used up all your guesses. #{chosen_one.name} was the guilty suspect."
          return false
        end
      end
    end
    
    def ask_questions(choice)
      case choice
      when "hair"
        ask_about_hair
      when "gender"
        ask_about_gender
      when "eye"
        ask_about_eye
      when "skin"
        ask_about_skin
      when "exit"
        false
      end
    end
    
    def print_list_of_suspects
      puts "List of Suspects"
      puts "-------------------------------------------------"
      
      suspects.each do |suspect|
        puts suspect.name.capitalize
      end
      
      puts "-------------------------------------------------"
    end
    
    def take_a_guess
      print_list_of_suspects
      puts "-------------------------------------------------"
      puts "Who might the suspect be? You have #{guess_count} guesses left."
      
      potential_suspect = gets.chomp.downcase
      
      if potential_suspect == chosen_one.name
        puts "You FOUND the suspect! It is #{potential_suspect}. Run the file to play again!"
        return false
      else
        puts "-------------------------------------------------"
        puts "Nope. #{potential_suspect} is not the one."
        puts "-------------------------------------------------"
        
        suspects.reject { |suspect| suspect.name == potential_suspect }
        
        self.guess_count -= 1
      end
    end
    
    def ask_about_hair
      puts "-------------------------------------------------"
      puts "what hair color? (brown, black, blonde, or auburn)"
      
      hair = gets.chomp.downcase
      
      if hair != chosen_one.hair_color
        suspects.reject { |suspect| suspect.hair_color == hair }
        
        puts "-------------------------------------------------"
        puts "The suspect's hair color is not #{hair}"
        puts "-------------------------------------------------"
      end
      
      if hair == chosen_one.hair_color
        suspects.keep_if { |suspect| suspect.hair_color == hair }
        puts "-------------------------------------------------"
        puts "The suspect's hair color is #{hair}"
        puts "-------------------------------------------------"
      end
      take_a_guess
    end
    
    def ask_about_gender
      puts "-------------------------------------------------"
      puts "what gender? (boy or girl)"
      
      gender = gets.chomp.downcase
      
      if gender != chosen_one.gender
        suspects.reject { |suspect| suspect.gender == gender }
        puts "-------------------------------------------------"
        puts "The suspect is not a #{gender}"
        puts "-------------------------------------------------"
      end

      if gender == chosen_one.gender
        suspects.keep_if { |suspect| suspect.gender == gender }  
        puts "-------------------------------------------------"
        puts "The suspect is a #{gender}"
        puts "-------------------------------------------------"
      end
      take_a_guess
    end
    
    def ask_about_eye
      puts "-------------------------------------------------"
      puts "what eye color? (brown, blue, or green)"
      
      eye_color = gets.chomp.downcase

      if eye_color != chosen_one.eye_color
        suspects.reject { |suspect| suspect.eye_color == eye_color }
        
        puts "-------------------------------------------------"
        puts "The suspect's eye color is not #{eye_color}"
        puts "-------------------------------------------------"
      end
      
      if eye_color == chosen_one.eye_color
        suspects.keep_if { |suspect| suspect.eye_color == eye_color }
        puts "-------------------------------------------------"
        puts "The suspect's eye color is #{eye_color}"
        puts "-------------------------------------------------"
      end
      take_a_guess
    end

    def ask_about_skin
      puts "-------------------------------------------------"
      puts "what skin color? (black or white)"

      skin_color = gets.chomp.downcase

      if skin_color != chosen_one.skin_color
        suspects.reject { |suspect| suspect.skin_color == skin_color }
        puts "-------------------------------------------------"
        puts "The suspect's skin color is not #{skin_color}"
        puts "-------------------------------------------------"
      end

      if skin_color == chosen_one.skin_color
        suspects.keep_if { |suspect| suspect.skin_color == skin_color }
        puts "-------------------------------------------------"
        puts "The suspect's skin color is #{skin_color}"
        puts "-------------------------------------------------"
      end
      take_a_guess
    end
end

GuessWho.new