json.array!(@providers) do |provider|
  json.extract! provider, :id, :company_name, :contact_first_name, :last_name, :company_phone_number, :company_street_address, :company_city, :company_state, :company_zip, :company_email, :password, :password_confirmation
  json.url provider_url(provider, format: :json)
end
