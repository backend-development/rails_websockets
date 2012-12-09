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

    it "can add a new step" do
      a = FactoryGirl.build(:full_adventure)
      no_of_stepstones = a.stepstones.count
      last_position = a.stepstones.last.position
      visit adventure_path(a)
      click_link "Add a new Stepstone"
      fill_in 'stepstone_title', :with => "the next step"
      click_button "Create Stepstone"
      a.reload
      a.stepstones.count.should == no_of_stepstones + 1
      a.stepstones.last.position.should == last_position + 1
    end
  end
end
