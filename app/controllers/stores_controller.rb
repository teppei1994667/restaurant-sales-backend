class StoresController < ApplicationController
  def index
  end

  def create
    @store = Store.create(store_params)
    p @store
    if @store.save
      render json: {message: "storeの作成が成功しました"}
    else
      render json: {message: "storeの作成が失敗しました"}
    end
  end

  private
  def store_params
    params.require(:store).permit(:user_id, :name, :address, :phone_number, :floor_space, :seating_capacity)
  end
end
