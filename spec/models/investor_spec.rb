require 'rails_helper'

RSpec.describe Investor, :type => :model do
  it { should have_secure_password }
end
