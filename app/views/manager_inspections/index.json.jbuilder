json.array!(@manager_inspections) do |manager_inspection|
  json.extract! manager_inspection, :id, :components, :new_countertop, :flooring, :appliances, :paint, :rent_ready, :property, :unit_number
  json.url manager_inspection_url(manager_inspection, format: :json)
end
