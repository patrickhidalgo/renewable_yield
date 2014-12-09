FactoryGirl.define do
  factory :user do
      company_name { Faker::Company.name }
      first_name { Faker::Name.first_name }
      middle_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      phone_number { Faker::PhoneNumber.cell_phone }
      street_address { Faker::Address.street_address }
      city { Faker::Address.city }
      state { Faker::Address.state_abbr }
      zip { Faker::Address.zip_code }
      email { Faker::Internet.free_email(first_name) }
      ssn { Faker::Number.number(9) }
      password { Faker::Internet.password }
      password_confirmation { password }
    end
  end
