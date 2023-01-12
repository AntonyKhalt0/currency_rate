FactoryBot.define do
  factory :exchange_rate do
    from_name { 'USD' }
    from_code { 840 }
    to_name { 'RUB' }
    to_code { 643 }
    buy { 76.7 }
    sell { 80.65 }
  end
end
