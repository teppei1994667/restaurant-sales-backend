class DialySalesController < ApplicationController

	# 売上一覧をJson形式で返却します
	def index
		if params[:day] 
			@sales = DialySale.where("day LIKE ?", "#{params[:day]}%")
		else
			@sales = DialySale.all
		end
		render json: @sales
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

	# 売り上げを削除します。
	def destroy
		dialy_sale_ids = params[:id].split(",")
		DialySale.destroy(dialy_sale_ids)
	end

	private
	
	def dialy_sale_params
		params.require(:dialy_sale).permit(:day, :lunch_sales, :dinner_sales, :lunch_visitor, :dinner_visitor, :personnel_cost, :purchase)
	end
end
