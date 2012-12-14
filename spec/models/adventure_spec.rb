require 'spec_helper'

describe Adventure do

  before :each do
    @adventure = FactoryGirl.build(:full_adventure)
  end

  it 'should be output as json' do
    @adventure.board_as_json.should be_an_instance_of(String)
  end
end
