# spec/show_results_spec.rb
require 'game'

describe Game do
  subject(:object) { described_class }
  let(:player1) { double :player }
  let(:player2) { double :player }

  describe '#match' do
    it 'declares Player 1 wins' do
      expect(player1).to receive(:choice).and_return(:rock).at_most(3).times
      expect(player2).to receive(:choice).and_return(:scissors).at_most(3).times
      game = Game.new(player1, player2, 1)
      game.match
      expect(game.winner).to eq player1
      expect(game.declaration).to eq "You Win!"
    end

    it 'declares Player 1 loses' do
      expect(player1).to receive(:choice).at_most(3).times.and_return(:rock)
      expect(player2).to receive(:choice).at_most(3).times.and_return(:paper)
      game = Game.new(player1, player2, 1)
      game.match
      expect(game.winner).to eq player2
      expect(game.declaration).to eq "You Lose!"
    end

    it 'declares the game was tie' do
      game = Game.new(player1, player2, 1)
      expect(player1).to receive(:choice).and_return(:rock).at_most(3).times
      expect(player2).to receive(:choice).and_return(:rock).at_most(3).times
      game.match
      expect(game.winner).to eq nil
      expect(game.declaration).to eq "It is a tie!"
    end
  end
end
