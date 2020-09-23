require 'test_helper'

class PetTest < ActiveSupport::TestCase
  def setup
    @pet = Pet.new(
      name: Faker::Name.name, 
      date_of_birth: rand(10).years.ago, 
      pet_type: ["dog", "cat", "others"].sample
    )
  end

  test 'valid pet' do
    assert @pet.valid?
  end

  test 'invalid without name' do
    @pet.name = nil
    refute @pet.valid?, 'saved pet without a name'
    assert_not_nil @pet.errors[:name], 'no validation error for name present'
  end

  test 'invalid without date of birth' do
    @pet.date_of_birth = nil
    refute @pet.valid?
    assert_not_nil @pet.errors[:date_of_birth]
    assert_equal @pet.errors[:date_of_birth].count, 2
  end
end