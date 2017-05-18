json.array!(@devices) do |device|
  json.extract! device, :id, :fcc_id, :baudrate, :frequency, :modulation, :encoding, :name, :notes
  json.url device_url(device, format: :json)
end
