json.id    customer.id
json.name  customer.name
json.set! :vehicle_ids, customer.vehicles.pluck(:id)
