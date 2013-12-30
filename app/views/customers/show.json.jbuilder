json.customers do |json|
  json.id @customer.id
  json.name @customer.name
  json.vehicles(@customer.vehicles.collect(&:id))
end
