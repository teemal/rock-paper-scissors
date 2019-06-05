class Game
  attr_accessor :left, :wins
  attr_reader :started, :finished

  wins = 0

  def start
    @started = true
  end

  def finished
    @finished = false
  end

  def started?
    self.started || false
  end

  def points(side)
    # if (side == left)
    #   wins + 1
    # else
    #   wins - 1
    # end

    #was going to use this as a points system to determin wins but I'm dumb and about to hit the time deadline
  end

  def play(left = nil, right = nil)
    raise 'Game must first be started' unless started?
    return nil unless (left && right)
    if (left == :rock && right == :scissors)
      points(left)
      "Rock beats scissors!"
    elsif (left == :scissors && right == :rock)
      points(right)
      "Rock beats scissors!"
    elsif (left == :paper && right == :rock)
      points(left)
      "Paper beats rock!"
    elsif (left == :rock && right == :paper)
      points(right)
      "Paper beats rock!"
    elsif (left == :scissors && right == :paper)
      points(left)
      "Scissors beats paper!"
    elsif (left == :paper && right == :scissors)
      points(right)
      "Scissors beats paper!"
    elsif (left == :paper && right == :paper or left == :scissors && right == :scissors or left == :rock && right == :rock)
      "Tie!"
    else
      :UNKNOWN
    end
  end

  def finished?
    self.finished || true
  end

  def isFinished
    if wins > 2 or wins < -2
      finished = true
    end
  end

end