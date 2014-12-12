class Project < ActiveRecord::Base
  belongs_to :user

  def self.seed_data!
    puts 'Seed some projects!'
  end
end
