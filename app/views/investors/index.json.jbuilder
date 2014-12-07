json.array!(@investors) do |investor|
  json.extract! investor, :id, :first_name, :middle_name, :last_name, :phone_number, :street_address, :city, :state, :zip, :email, :ssn, :password, :password_confirmation
  json.url investor_url(investor, format: :json)
end
