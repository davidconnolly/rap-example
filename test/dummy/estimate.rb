class Estimate
  dummy :cost do
    # Between $1 (100 cents) and $10,000 (100 cents + 999900 cents)
    100 + rand(999900)
  end

  dummy :customer

end
