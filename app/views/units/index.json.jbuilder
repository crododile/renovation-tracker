json.array!(@units) do |unit|
  json.extract! unit, :id, :property, :unit_number, :unit_type, :square_feet, :rent, :date
  json.url unit_url(unit, format: :json)
end
