class DialySalesController < ApplicationController
  # 売上一覧をJson形式で返却します
  def index
    @dialy_sales = DialySale.new
    if params[:start_day] && params[:end_day]
      dialy_sales = DialySale.where(store_id: params[:store_id], sales_day: params[:start_day]..params[:end_day])
    else
      dialy_sales = DialySale.all
    end
		@return_dialy_sales = @dialy_sales.convert_dialy_sales(dialy_sales)
    render json: @return_dialy_sales
  end

  # 新規の売上を作成します。
  def create
    @new_dialy_sale = DialySale.new(dialy_sale_params)
    if @new_dialy_sale.save
      @dialy_sales = DialySale.new
      if params[:start_day] && params[:end_day]
        dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id], sales_day: params[:start_day]..params[:end_day])
      else
        dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id])
      end
      @return_dialy_sales = @dialy_sales.convert_dialy_sales(dialy_sales)
      render json: @return_dialy_sales
    else
      render json: @new_dialy_sale.errors, status: :unprocessable_entity
    end
  end

  # 売り上げを更新します。
  def update
    @dialy_sale = DialySale.find(params[:id])

    if @dialy_sale.update(dialy_sale_params)
      @dialy_sales = DialySale.new
      if params[:start_day] && params[:end_day]
        dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id], sales_day: params[:start_day]..params[:end_day])
      else
        dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id])
      end
      @return_dialy_sales = @dialy_sales.convert_dialy_sales(dialy_sales)
      render json: @return_dialy_sales
      # render json: @dialy_sale
    else
      render json: @dialy_sale.errors, status: :unprocessable_entity
    end
  end

  # 売り上げを削除します。
  def destroy
    dialy_sale_ids = params[:delete_ids]
    dialy_sale_ids.each do |dialy_sale_id|
      DialySale.find(dialy_sale_id).destroy
    end
    @dialy_sales = DialySale.new
    if params[:start_day] && params[:end_day]
      dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id], sales_day: params[:start_day]..params[:end_day])
    else
      dialy_sales = DialySale.where(store_id: dialy_sale_params[:store_id])
    end
    @return_dialy_sales = @dialy_sales.convert_dialy_sales(dialy_sales)
    render json: @return_dialy_sales
  end

  private

  def dialy_sale_params
    params.require(:dialy_sale).permit(:store_id, :sales_day, :lunch_sales, :dinner_sales, :lunch_visitor, :dinner_visitor, :personnel_cost,
                                       :purchase)
  end
end
