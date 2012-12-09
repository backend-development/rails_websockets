
FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "person#{n}@example.com" }
    sequence(:nickname)   {|n| "person#{n}" }
    password              "arenaren"
    password_confirmation { |u| u.password }
    created_at            Time.now.utc
  end
end
FactoryGirl.define do
  factory :confirmed_user, :parent => :user do |u|
    after(:build) do |user|
      user.confirm! 
    end
  end
end

