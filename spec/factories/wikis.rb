# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wiki do
    name "MyString"
    body "MyText"
    private false
    user nil
  end
end
