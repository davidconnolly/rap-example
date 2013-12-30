json.customers do |json|
  json.array! @customers do |customer|
    json.id customer.id
    json.name customer.name
    json.vehicles (customer.vehicles.collect(&:id))
  end
end
