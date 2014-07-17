json.array!(@inspectors) do |inspector|
  json.extract! inspector, :id, :inspector
  json.url inspector_url(inspector, format: :json)
end
