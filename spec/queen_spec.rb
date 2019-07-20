RSpec.describe Shantay::Queen do

  it 'exists' do
    expect(Shantay::Queen).not_to be(nil)
  end

  describe 'find' do
    it 'gives back a single queen' do
      VCR.use_cassette('one_queen') do
        queen = Shantay::Queen.find(89)
        expect(queen).to be_instance_of(Shantay::Queen)
      end
    end

    it 'returns a queen with attributes' do
      VCR.use_cassette('one_queen') do
        queen = Shantay::Queen.find(89)
        expect(queen.name).to eq('Trixie Mattel')
        expect(queen.winner).to eq(true)
        expect(queen.miss_congeniality).to eq(false)
        expect(queen.quote).to eq('Alright, Public school, calm down.')
        expect(queen.image_url).to eq('http://www.nokeynoshade.party/images/trixie-mattel.jpg')
      end
    end
  end

  describe 'all' do
    it 'returns an array of Queen objects' do
      VCR.use_cassette('all_queens') do
        all_queens = Shantay::Queen.all
        expect(all_queens.count).to eq(126)
        expect(all_queens.first).to be_instance_of(Shantay::Queen)
      end
    end
  end

end
