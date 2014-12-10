require 'rails_helper'

RSpec.describe Investment, :type => :model do
  it { should validate_numericality_of(:minimum_order).
    is_greater_than(999.99) }
  it { should belong_to (:user) }
end
