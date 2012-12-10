require 'spec_helper'

describe "Join Adventure" do
  include Capybara::DSL
  before(:each) do
    @a = FactoryGirl.create(:full_adventure)
  end

  describe "not logged in" do
    it "cannot access join button" do
      visit root_path
      page.should_not have_button("Join")
    end
  end

  describe "logged in" do
    before(:each) do
      @u = log_in
    end

    it "can join an adventure" do
      visit root_path
      click_button 'Join'
      page.should have_content( @a.title )
    end

  end
end
