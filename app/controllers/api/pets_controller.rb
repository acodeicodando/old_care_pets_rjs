class Api::PetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_pet, only: [:show, :edit, :update]

  def index
    @pets = Pet.all
    render formats: [:json]
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      render action: :show, formats: [:json]
    else
      render json: { errors: @pet.errors.full_messages }, status: 422
    end
  end

  def edit
  end

  def update
  end

  def show
    render formats: [:json]
  end

  protected
  def set_pet
    @pet = Pet.friendly.find(params[:id])
    @pet.build_pet_adoption if @pet.pet_adoption.nil?
  end

  def pet_params
    params.permit(
      :name, :date_of_birth, :pet_type,
      pet_adoption_attributes: [:id, :adopted_by, :adopted_at]
    )
  end
end
