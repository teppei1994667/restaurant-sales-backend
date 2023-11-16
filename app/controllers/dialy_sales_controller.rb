class DialySalesController < ApplicationController

	# 売上一覧をJson形式で返却します
	def index
		@sales = DialySale.all

		render json: @sales
	end
end
