json.array!(@captures) do |capture|
  json.extract! capture, :id, :unit_id, :device_id, :name, :notes, :binary, :original_binary
  json.url capture_url(capture, format: :json)
end
