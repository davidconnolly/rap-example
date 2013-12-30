json.vehicles do
  json.id @vehicle.id
  json.make @vehicle.make
  json.year @vehicle.year
  json.customer @vehicle.customer
end
