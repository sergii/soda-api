FactoryBot.define do
  factory :word do
    word { Faker::Lorem.unique.word }
    appearance { Faker::Number.number(10) }
  end
end
