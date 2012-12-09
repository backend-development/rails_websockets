require 'spec_helper'

describe "Create Adventure" do
  include Capybara::DSL

  describe "not logged in" do
    it "cannot access new form" do
      visit new_adventure_path
      current_path_info.should == new_user_session_path
    end
  end

  describe "logged in" do
    before(:each) do
      @u = log_in
    end

    it "can access new form" do
      visit adventures_path 
      click_link 'New'
      current_url.should == new_adventure_url
    end

    it "can create adventure" do
      visit new_adventure_path 
      fill_in 'adventure_title',       :with => "the new adventure"
      fill_in 'adventure_description', :with => "is challenging!"
      click_button "Create Adventure"
      current_url.should match /adventure/
      a = Adventure.last
      a.title.should == "the new adventure"
      a.user_id == @u.id
    end
  end
end
