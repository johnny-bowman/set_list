require 'rails_helper'

RSpec.describe 'the songs show page' do
  it "displays the song title" do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: 'I Really Like You', length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: 'Call Me Maybe', length: 207, play_count: 21456357)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to have_no_content(song_2.title)
  end

  it 'displays the artist name of a song' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: 'I Really Like You', length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: 'Call Me Maybe', length: 207, play_count: 21456357)
    visit "/songs/#{song.id}"
    save_and_open_page
    
    expect(page).to have_content(artist.name)
  end
end
