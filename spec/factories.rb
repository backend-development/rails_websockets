
FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "person#{n}@example.com" }
    sequence(:nickname)   {|n| "person#{n}" }
    password              "arenaren"
    password_confirmation { |u| u.password }
    created_at            Time.now.utc
  end


  factory :confirmed_user, :parent => :user do |u|
    after(:build) do |user|
      user.confirm! 
    end
  end

  factory :stepstone do
    adventure
    sequence(:title)   {|n| "#{n} is another stepstone" }
    description "another one"
  end

  factory :adventure do
    user
    sequence(:title)   {|n| "Adventure on Cloud #{n}" }
    description "n a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort."
  end

  factory :full_adventure, :parent => :adventure do |a|
    after(:build) do |adventure|
      s1 = FactoryGirl.build( :stepstone, :adventure => adventure )
      s2 = FactoryGirl.build( :stepstone, :adventure => adventure )
      s3 = FactoryGirl.build( :stepstone, :adventure => adventure )
      u = FactoryGirl.build( :confirmed_user )
      adventure.stepstones = [ s1, s2, s3 ]
      adventure.user = u
      adventure.save!
    end
  end

  factory :step do
    stepstone
    user
  end
end

