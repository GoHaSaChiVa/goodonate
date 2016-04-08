json.array!(@donations) do |donation|
  json.extract! donation, :id, :category, :quantity, :organization
  json.url donation_url(donation, format: :json)
end
