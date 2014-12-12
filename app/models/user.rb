class User < ActiveRecord::Base
  has_secure_password
  has_many :investments
  has_many :projects
  # has_many :roles

  validate :password, presence: true

  ROLES = %w[admin manager investor provider]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    [role.to_sym]
  end

  def role?(role)
    roles.include? role.to_s
  end

  def self.seed_user!
    20.times do |number|
      @first_name = Faker::Name.first_name
      @password = Faker::Internet.password

      User.create!(
        :company_name => Faker::Company.name,
        :first_name => @first_name,
        :middle_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :phone_number => Faker::PhoneNumber.cell_phone,
        :street_address => Faker::Address.street_address,
        :city => Faker::Address.city,
        :state => Faker::Address.state_abbr,
        :zip => Faker::Address.zip_code,
        :email => Faker::Internet.free_email(@first_name),
        :ssn => Faker::Number.number(9),
        :password => @password,
        :password_confirmation => @password,
        :role => 'investor'

      )
    end
  end


end
