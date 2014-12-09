json.array!(@users) do |user|
  json.extract! user, :id, :company_name, :first_name, :middle_name, :last_name, :phone_number, :street_address, :city, :state, :zip, :email, :ssn, :password_digest
  json.url user_url(user, format: :json)
end
