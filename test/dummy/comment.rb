class Comment
  dummy :note do 
    Faker::Lorem.paragraph(3).truncate(255)
  end
  
  dummy do |comment|
    #create Invoice, Estimate or Problem
    comment.record ||= Invoice.create_dummy
  end
end