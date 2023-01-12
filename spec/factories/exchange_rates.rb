# frozen_string_literal: true

FactoryBot.define do
  factory :exchange_rate do
    from_name { 'EUR' }
    from_code { 840 }
    to_name { 'RUB' }
    to_code { 643 }
    buy { 71.85 }
    sell { 77.45 }
  end
end
