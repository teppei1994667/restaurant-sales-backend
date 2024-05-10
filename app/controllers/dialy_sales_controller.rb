class DialySalesController < ApplicationController
  # 売上一覧をJson形式で返却します
  def index
    @dialy_sale = DialySale.new
    if params[:start_day] && params[:end_day]
      dialy_sales = DialySale.where(sales_day: params[:start_day]..params[:end_day])
    else
      dialy_sales = DialySale.all
    end
		@return_dialy_sales = @dialy_sale.convert_dialy_sales(dialy_sales)
    render json: @return_dialy_sales
  end

  # 新規の売上を作成します。
  def create
    @dialy_sale = DialySale.new(dialy_sale_params)
    if @dialy_sale.save
      render json: @dialy_sale, status: :created, location: @dialy_sale
    else
      render json: @dialy_sale.errors, status: :unprocessable_entity
    end
  end

  # 売り上げを更新します。
  def update
    @dialy_sale = DialySale.find(params[:id])

    if @dialy_sale.update(dialy_sale_params)
      render json: @dialy_sale
    else
      render json: @dialy_sale.errors, status: :unprocessable_entity
    end
  end

  # 売り上げを削除します。
  def destroy
    dialy_sale_ids = params[:id].split(',')
    DialySale.destroy(dialy_sale_ids)
  end

  private

  def dialy_sale_params
    params.require(:dialy_sale).permit(:store_id, :sales_day, :lunch_sales, :dinner_sales, :lunch_visitor, :dinner_visitor, :personnel_cost,
                                       :purchase)
  end
end
