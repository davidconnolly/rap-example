class Problem
  dummy :description do 
    Faker::Lorem.paragraph(3).truncate(255)
  end

  dummy :vehicle
  
end