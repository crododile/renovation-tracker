json.array!(@currentunits) do |currentunit|
  json.extract! currentunit, :id
  json.url currentunit_url(currentunit, format: :json)
end
