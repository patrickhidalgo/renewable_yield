class User < ActiveRecord::Base
  has_secure_password
  has_many :investments
  has_many :projects
  # has_many :roles

  # validates :password, presence: true

  ROLES = %w[admin manager investor provider] #
  validates :role, inclusion: { in: ROLES}

  def admin?
    self.role == ROLES[0]
  end

  def manager?
    self.role == ROLES[1]
  end

  def investor?
    self.role == ROLES[2]
  end

  def provider?
    self.role == ROLES[3]
  end

  def needs_verification!
    update_attributes!(
      token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    UserNotifier.signed_up(self).deliver
  end

  def self.seed_data!
    20.times do |number|
      first_name = Faker::Name.first_name
      if number >= 10
        role = 'provider'
        if number == 10
          email = Faker::Internet.free_email(role)
          password = role
        else
          email = Faker::Internet.free_email(first_name)
          password = Faker::Internet.password
        end
      elsif number == 0
        role = 'admin'
        email = Faker::Internet.free_email(role)
        password = role
      elsif number == 1
        role = 'manager'
        email = Faker::Internet.free_email(role)
        password = role
      elsif number == 2
        role = 'investor'
        email = Faker::Internet.free_email(role)
        password = role
      else
        email = Faker::Internet.free_email(first_name)
        password = Faker::Internet.password
      end

      user = User.create!(
        :company_name => Faker::Company.name,
        :first_name => first_name,
        :middle_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :phone_number => Faker::PhoneNumber.cell_phone,
        :street_address => Faker::Address.street_address,
        :city => Faker::Address.city,
        :state => Faker::Address.state_abbr,
        :zip => Faker::Address.zip_code,
        :email => email,
        :ssn => Faker::Number.number(9),
        :password => password,
        :password_confirmation => password,
        :role => role
      )
    end
  end


end
