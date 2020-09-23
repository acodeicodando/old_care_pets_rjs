class Api::PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update]

  def index
    @pets = Pet.all
    render formats: [:json]
  end

  def create
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
end
