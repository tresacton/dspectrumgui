json.array!(@units) do |unit|
  json.extract! unit, :id, :device_id, :name, :notes
  json.url unit_url(unit, format: :json)
end
