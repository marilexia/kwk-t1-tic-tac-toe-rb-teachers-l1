def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


####################

def input_to_index(user_input)
  user_input.to_i - 1
end

####################

def move(board, index, current_player = "X")
  board[index] = current_player
end

####################

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

####################

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

####################

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

####################

def current_player (board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

####################

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|

  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0] #row
    win_index_2 = win_combination[1] # column
    win_index_3 = win_combination[2] # diagonal

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
      break
    end

    if position_1 == "O" && position_2 == "O" && position_3 =="O"
      return win_combination
      break
    end

  end
        return false
end

####################

def full?(board)

  board.each do |token|
    if token == " " || token == ""
      return false
      break
    end
  end
      return true

end

####################

def draw?(board)

  if won?(board)
    return false
  else full?(board)
    return true
  end

end

####################

def over?(board)

  if won?(board) || full?(board)
    return true
  else
    return false
  end

end

####################

def winner(board)

  if won?(board)
    winning_token = won?(board)
    winner = board[winning_token[0]]
    return winner
  else
    return nil
  end

end

####################

def play(board)
  turn = 0
  until turn == 9
    turn += 1
    turn(board)
  end
end

####################
