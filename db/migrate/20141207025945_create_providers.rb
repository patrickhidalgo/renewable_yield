class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :company_name
      t.string :contact_first_name
      t.string :last_name
      t.string :company_phone_number
      t.string :company_street_address
      t.string :company_city
      t.string :company_state
      t.integer :company_zip
      t.string :company_email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end
end
