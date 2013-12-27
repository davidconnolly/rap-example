require 'faraday'
require 'faraday_middleware'
require 'active_support/core_ext/string/inflections.rb'

conn = Faraday.new(:url => 'http://0.0.0.0:3000') do |faraday|
  faraday.response :rashify
  # faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.request :json
  faraday.response :json, :content_type => 'application/json'
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

def create (conn, type, params)
  valid = false

  conn.post do |req|
    req.url '/'+ type.pluralize(2)
    req.headers['Content-Type'] = 'application/json'
    req.body = params
  end
end

def update (conn, type, id, params)
  conn.put do |req|
    req.url '/'+ type.pluralize(2) +'/' + id.to_s
    req.headers['Content-Type'] = 'application/json'
    req.body = params
  end
end

def get (conn, type, index)
  response = conn.get '/' + type + '/' + index.to_s  
  return response.body
end

def destroy (conn, type, index)
  response = conn.delete '/' + type + '/' + index.to_s
  return response.body
end

def index (conn, type)
  response = conn.get type.pluralize(2)
  case type
    when 'customer' then return response.body.customers
    when 'vehicle' then return response.body.vehicles
  end
end

puts "------ Customers Index ------ "
i = 0
response = index(conn, 'customer')
while i < response.size  do
   puts("Customer " + response[i].id.to_s + "'s name is " + response[i].name)
   i +=1
end

puts "------ Create Customsers ------ "
to_delete = create(conn, 'customer', { name: "Foo" }).body.id
puts "Created Customer id " + get(conn, 'customers', to_delete)['customers'].id.to_s + " with name: " + get(conn, 'customers', to_delete)['customers'].name

puts "------ Update Customsers ------ "
update(conn, 'customer', to_delete, { name: "Foo New" })
puts "Updated Customer with id " + get(conn, 'customers', to_delete)['customers'].id.to_s + " to name: " + get(conn, 'customers', to_delete)['customers'].name

puts "------ Delete Customsers ------ "
destroy(conn, 'customers', to_delete)
puts "Deleted Customer with id " + to_delete.to_s

puts "------ Vehicles Index------ "
i = 0
response = index(conn, 'vehicle')
while i < response.size  do
   puts("Vehicle " + response[i].id.to_s + " is a " + response[i].year.to_s + " " + response[i].make + " belonging to " + get(conn, 'customers', response[i].customer)['customers'].name)
   i +=1
end

#destroy(conn, 'customers', #)
