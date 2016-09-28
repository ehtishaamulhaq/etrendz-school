json.array!(@timetable_entries) do |timetable_entry|
  json.extract! timetable_entry, :id, :batch_id
  json.url timetable_entry_url(timetable_entry, format: :json)
end
