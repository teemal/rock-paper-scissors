require_relative '../lib/game'

describe 'A game of rock paper scissors' do

  it 'exists' do
    Game.new
  end

  it 'can start' do
    Game.new.start
  end

  it 'is not initially started' do
    game = Game.new
    expect(game).to_not be_started
  end

  it 'a started game knows that it has started' do
    game = Game.new
    game.start
    expect(game).to be_started
  end

  describe 'playing' do

    context 'without starting' do
      it 'can not be played if it has not started' do
        game = Game.new
        expect { game.play }.to raise_error(RuntimeError)
      end
    end

    context 'after starting' do
      it 'can be played if it has started' do
        game = Game.new
        game.start
        expect { game.play }.to_not raise_error
      end

      it 'returns nil when not provided with anything' do
        game = Game.new
        game.start
        expect(game.play).to be_nil
      end

      it 'returns nil when only provided one rock, paper or scissor' do
        game = Game.new
        game.start
        expect(game.play(:FAKE)).to be_nil
      end

      it 'does not return nil when two objects are provided' do
        game = Game.new
        game.start
        expect(game.play(:FAKE, :FAKE)).to_not be_nil
      end
    end

    context 'rock vs scissors' do
      it 'announces the correct winner' do
        game = Game.new
        game.start
        expect(game.play(:rock, :scissors)).to eq("Rock beats scissors!")
        expect(game.play(:scissors, :rock)).to eq("Rock beats scissors!")
      end
      #skip('is finished')
      it "is finished" do
        game = Game.new
        game.start
        expect(game.play(:rock, :scissors)).to eq("Rock beats scissors!")
        expect(game.play(:rock, :scissors)).to eq("Rock beats scissors!")
      end
    end

    context 'rock vs paper' do
      # skip('returns "Paper beats rock!"')
      it "announces when paper beats rock" do
        game = Game.new
        game.start
        expect(game.play(:rock, :paper)).to eq("Paper beats rock!")
        expect(game.play(:rock, :paper)).to eq("Paper beats rock!")
      end
      skip('is finished')
    end


    context 'scissors vs paper' do
      # skip('returns "Scissors beats paper!"')
      it "announces when scissors beat paper" do
        game = Game.new
        game.start
        expect(game.play(:scissors, :paper)).to eq("Scissors beats paper!")
        expect(game.play(:scissors, :paper)).to eq("Scissors beats paper!")
      end
      skip('is finished')
    end

    context 'a tie game' do
      # skip('returns "Tie game. Try again!"')
      it "announces when there is a tie game" do
        game = Game.new
        game.start
        expect(game.play(:scissors, :scissors)).to eq("Tie!")
        expect(game.play(:scissors, :scissors)).to eq("Tie!")
        game = Game.new
        game.start
        expect(game.play(:paper, :paper)).to eq("Tie!")
        expect(game.play(:paper, :paper)).to eq("Tie!")
        game = Game.new
        game.start
        expect(game.play(:rock, :rock)).to eq("Tie!")
        expect(game.play(:rock, :rock)).to eq("Tie!")
      end
      skip('is not finished')
    end

  end

end
