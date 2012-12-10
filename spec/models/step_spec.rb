require 'spec_helper'

describe Step do

  before :each do
    @user = FactoryGirl.build(:confirmed_user)
    @adventure = FactoryGirl.build(:full_adventure)
    @stepstone = @adventure.stepstones.first
    @step = FactoryGirl.build(:step, :user => @user, :stepstone => @stepstone)
  end

  describe 'states' do
    describe ':created' do
      it 'should be an initial state' do
        @step.created?.should be_true
      end

    end
  end
end
