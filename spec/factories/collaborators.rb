# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collaborator do
    factory :wiki do
      name "My String"
      body "My Text"
      private false
      user nil
  end
end
