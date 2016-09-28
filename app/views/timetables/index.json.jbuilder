json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :start_date
  json.url timetable_url(timetable, format: :json)
end
