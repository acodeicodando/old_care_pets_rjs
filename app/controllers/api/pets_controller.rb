class Api::PetsController < ApplicationController
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
  end
end
