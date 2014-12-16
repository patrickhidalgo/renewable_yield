class Project < ActiveRecord::Base
  # request = open('http://developer.nrel.gov/api/pvwatts/v5.json?api_key=mOwXKaie0UZB8tihBfZj5b2YpYkETjc33Yl5J1EM&lat=40&lon=-105&system_capacity=4&azimuth=180&tilt=40&array_type=1&module_type=1&losses=10')
  belongs_to :user
  # has_one :nrel_data

  # app/models/nrel_data.rb
  # class NrelData < AR::Base
  #   belongs_to :user
  # end

  def self.per_page
    5
  end

  def self.seed_data!
    20.times do |number|
      @user_id = 11 + (number/10)
      Project.create(
      :format => ['json', 'xml'].sample,
      :api_key => Faker::Internet.password,
      :system_capacity => rand(1..10),
      :module_type => rand(0..2),
      :losses => rand(-5..99),
      :array_type => rand(0..4),
      :tilt => rand(0..99),
      :azimuth => rand(0..360),
      :address => "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr}  #{Faker::Address.zip}",
      :lat => Faker::Address.latitude.to_f.round(12),
      :lon => Faker::Address.longitude.to_f.round(12),
      :file_id => 94018,
      :dataset => ['tmy2', 'tmy3', 'intl'].sample,
      :radius => 100,
      :timeframe => 'monthly',
      :dc_ac_ratio => 1.1,
      :gcr => rand(0..3),
      :inv_eff => rand(90..99.5),
      :callback => 'JSON',
      :npv => rand(-20_000..20_000),
      :irr => rand(-5..10),
      :project_score => rand(0..100),
      :status => ['Funded', 'Not Funded'].sample,
      :user_id => @user_id
      )
    end
  end
end
