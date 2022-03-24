require 'rails_helper'
# As a user
# when i visit an Artist's Songs index
# Then I see the titles all of that Artist's songs
# And I see that each title is a link to the songs show page

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 243, play_count: 456476)
    @beret = @prince.songs.create!(title: 'Rasberry Beret', length: 322, play_count: 346322)
  end

  it 'shows all of the song titles for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 282.5")
  end
end
