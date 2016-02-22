json.array!(@events) do |event|
  json.extract! event, :id, :event_type_id, :happen_in
  json.url event_url(event, format: :json)
end
