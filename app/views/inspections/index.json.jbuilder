json.array!(@inspections) do |inspection|
  json.extract! inspection, :id, :property, :unit_number, :inspector, :occupied_rehab, :turn_rehab, :inspection_date, :comments
  json.url inspection_url(inspection, format: :json)
end
