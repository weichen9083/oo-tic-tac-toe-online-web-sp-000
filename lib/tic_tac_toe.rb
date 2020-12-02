

class TicTacToe 
  
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
  def initialize 
       @board = [" "," "," "," "," "," "," "," "," "]

  end 
  

  def display_board(board = @board)
    
puts 'display board'    
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end 
  
  
def input_to_index(move)
   index = move.to_i - 1
   
end
  
  
def move(index, token = "X")
  @board[index] = token

end



   def position_taken?(position)
        if @board[position] == " "
            false
        else 
            true 
        end 
     end 
    
     def valid_move?(index)
      if position_taken?(index) == false && index.between?(0,8)
        puts 'this is a valid move'
        true 
      else 
        false 
      end    
    
end 
    
    



def turn_count 
        count = 0 
        @board.each do |counter| 
            if counter == "X" || counter =="O"
                count +=1
            end 
        end 
        count 
    end 
  

def current_player
  if turn_count % 2 == 0 
            "X"
        else 
            "O"
        end 
    end 







def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if valid_move?(index)
            puts 'valid move'
            move(index,token)
            display_board(@board)
        else 
            puts "try again"
            self.turn
        end 
        
    end 





def won?
        WIN_COMBINATIONS.detect do |win_combo|
         if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
            return win_combo
          elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
            return win_combo
          end
            false
          end
     end



def full?
  @board.all?{|occupied| occupied != " "}
end
  
  

def draw?
  !won? && full?
end

  
  def over?
  won? || full? || draw?
end
 

def winner
  x = won? 
  @board[won[0]]
end



def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end 