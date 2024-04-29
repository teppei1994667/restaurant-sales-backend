class StoresController < ApplicationController
  def index
  end

  def create
    @store = Store.create(store_params)
    p @store
    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  private
  def store_params
    params.require(:store).permit(:user_id, :name, :address, :phone_number, :floor_space, :seating_capacity)
  end
end
