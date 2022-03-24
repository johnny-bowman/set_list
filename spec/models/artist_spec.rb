require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe 'average_song_length' do
      before :each do
        @prince = Artist.create!(name: 'Prince')
        @purple = @prince.songs.create!(title: 'Purple Rain', length: 243, play_count: 456476)
        @beret = @prince.songs.create!(title: 'Rasberry Beret', length: 322, play_count: 346322)
      end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(1)).to eq(282.5)
      end
    end
  end
end
