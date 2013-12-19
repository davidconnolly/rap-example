require 'rubygems'
require 'json-schema'

$customer_schema = {
  "type" => "object",
  "required" => ["name"],
  "properties" => {
    "name" => {"type" => "string"}
  }
}

$vehicle_schema = {
  "type" => "object",
  "required" => ["make","year","customer_id"],
  "properties" => {
    "make" => {"type" => "string"},
    "year" => {"type" => "integer"},
    "customer_id" => {"type" => "string"}
  }
}