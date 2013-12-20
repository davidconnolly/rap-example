json.customers do |json|
  json.array! @customers do |customer|
    json.(customer, :id, :name, :created_at, :updated_at)
  end
end
