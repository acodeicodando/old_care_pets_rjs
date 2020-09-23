json.pets do
  json.array! @pets do |pet|
    json.pet do
      json.name pet.name
      json.date_of_birth pet.date_of_birth
      json.pet_type pet.pet_type
    end
  end
end