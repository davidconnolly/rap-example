class Comment
  dummy :note do 
    Faker::Lorem.paragraph(3).truncate(255)
  end
  
  dummy only: :with_record do |comment|
    #????
  end
end