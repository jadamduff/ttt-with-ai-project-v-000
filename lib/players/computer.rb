module Players

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  ORDER = [5, 1, 3, 7, 9, 2, 4, 6, 8]

  class Computer < Player

    def test_opp_gap(board)
      WIN_COMBINATIONS.find {|combo| (!board.cells[combo[0]] == self.token) && (!board.cells[combo[2]] == self.token)}
    end

    def test_own_gap(board)
      WIN_COMBINATIONS.find {|combo1| board.cells[combo1[0]] == self.token && board.cells[combo1[2]] == self.token}
    end

    def apply_counter(board)
      ORDER.each do |cell|
        if !board.taken?(cell)
          return cell.to_s
        end
      end
    end

    def move(board)
      if test_opp_gap(board)
        return test_opp_gap(board)
      elsif test_own_gap(board)
        return test_own_gap(board)
      else
        apply_counter(board)
      end
    end

  end

end
