json.array!(@employees) do |employee|
  json.extract! employee, :id, :emloyee_number, :joining_date
  json.url employee_url(employee, format: :json)
end
