class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :term
      t.decimal :interest_rate
      t.integer :minimum_order
      t.integer :denomination
      t.date :maturity_date
      t.date :issue_date
      t.date :offer_start_period
      t.date :offer_end_period

      t.timestamps
    end
  end
end
