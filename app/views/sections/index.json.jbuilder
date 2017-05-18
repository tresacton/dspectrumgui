json.array!(@sections) do |section|
  json.extract! section, :id, :device_id, :name, :notes, :start_pos, :end_pos, :colour
  json.url section_url(section, format: :json)
end
