require 'spec_helper'

describe "Public Viewing" do
  include Capybara::DSL
  before(:each) do
    @a = FactoryGirl.create(:full_adventure)
    @u = FactoryGirl.create(:confirmed_user)
    @a.user = @u
    @a.save!
  end

  it "cannot access join button" do
    visit root_path
    page.should_not have_button("Join")
  end

  it "can click on an adventure" do
    visit root_path
    click_link @a.title
    page.should have_content( "#{@a.title} by #{@a.user.nickname}" )
  end

  it "can click on an adventure" do
    visit adventure_path( @a )
    first(:link, "more").click
    page.should have_content( @a.title )
  end
end
