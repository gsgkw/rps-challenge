require 'spec_helper'
require_relative './web_helper'

feature "testing forms" do
  it "has a form on the homepage" do
    visit '/'
    expect(page).to have_field "player_1"
  end
  it "has a form on the homepage" do
    visit '/'
    expect(page).to have_field "player_2"
  end
  it "records name of player 1" do
    sign_in_and_play
    expect(page).to have_content 'Aloysius'
  end
  it "records name of player 1" do
    sign_in_and_play
    expect(page).to have_content 'Sebastian'
  end
  it "can select a move" do
    sign_in_and_play
    expect(page).to have_select "Move", options: ['Rock', 'Paper', 'Scissors']
  end
  it "passes move to results page" do
    sign_in_and_play
    choose_and_shoot
    expect(page).to have_content "#{@player_1} chose rock"
  end

end
