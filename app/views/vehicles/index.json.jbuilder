json.array! @vehicles do |vehicle|
  json.(vehicle, :id, :make, :year, :customer_id, :created_at, :updated_at)
end