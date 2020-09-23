class Api::PetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_pet, only: [:show, :update]

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

  def update
    if @pet.update(pet_params)
      render action: :show, formats: [:json]
    else
      render json: { errors: @pet.errors.full_messages }, status: 422
    end
  end

  def show
    render formats: [:json]
  end

  protected
  def set_pet
    @pet = Pet.friendly.find(params[:id])
  end

  def pet_params
    params.permit(
      :name, :date_of_birth, :pet_type,
      pet_adoption_attributes: [:id, :adopted_by, :adopted_at]
    )
  end
end
