require 'json-schema'

CUSTOMERS_INDEX_SCHEMA = {
  "type" => "object",
  "$schema" =>  "http://json-schema.org/draft-03/schema",
  "required" => true,
  "properties" => {
    "customers" =>  {
      "type" => "array",
      "required" => true,      
      "items" => {
        "type" => "object",
        "required" => true,        
        "properties" => {          
          "id" => {
            "type" => "number",
            "required" => true
          },          
          "name" => {
            "type" => "string",
            "required" => true
          },          
          "vehicles" => {
            "type" => "array",
            "required" => true,
            "items" => {
                "type" => "number",
                "required" => false
            }
          }
        }
      }
    }
  }
}

VEHICLES_INDEX_SCHEMA = {
  "type" => "object",
  "$schema" =>  "http://json-schema.org/draft-03/schema",
  "required" => true,
  "properties" => {
    "vehicles" =>  {
      "type" => "array",
      "required" => true,
      "items" => {
        "type" => "object",
        "required" => true,
        "properties" => {
          "customer" =>  {
            "type" => "number",
            "required" => true
          },
          "id" =>  {
            "type" => "number",
            "required" => true
          },
          "make" =>  {
            "type" => "string",
            "required" => true
          },
          "year" =>  {
            "type" => "number",
            "required" => true
          }
        }
      }
    }
  }
}
