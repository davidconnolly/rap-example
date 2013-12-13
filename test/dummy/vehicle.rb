class Vehicle
  dummy :make do
    Faker::Lorem.words(2).join(' ')
  end

  dummy :year do
    Date.today.year - rand(30)
  end

  dummy :customer
end
