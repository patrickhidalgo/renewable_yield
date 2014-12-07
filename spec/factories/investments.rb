FactoryGirl.define do
  factory :investment do
    term { rand(1..7) }
    interest_rate { 1.50 + (0.50 * term) }
    minimum_order 1000
    denomination 1000
    maturity_date { term.years.from_now }
    issue_date { Date.today }
    offer_start_period { issue_date }
    offer_end_period { 3.months.from_now }
  end
end
