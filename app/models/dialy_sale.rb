class DialySale < ApplicationRecord

	# datetimeをYYYY/MM/DD(W)の文字列に変更
	def datetime_to_string(_datetime)
		return _datetime.strftime("%Y/%m/%d") + "(" + %w(日 月 火 水 木 金 土)[_datetime.wday] + ")"
	end

	# DialySaleを一覧返却の形式に変換する
	def convert_dialy_sales(dialy_sales)
		new_dialy_sales = []
		dialy_sales.map do |dialy_sale|
			new_dialy_sales.push({
				id: dialy_sale.id,
				sales_day: self.datetime_to_string(dialy_sale.sales_day),
				lunch_sales: dialy_sale.lunch_sales,
				dinner_sales: dialy_sale.dinner_sales,
				lunch_visitor: dialy_sale.lunch_visitor,
				dinner_visitor: dialy_sale.dinner_visitor,
				personnel_cost: dialy_sale.personnel_cost,
				purchase: dialy_sale.purchase,
				total_sale: dialy_sale.lunch_sales + dialy_sale.dinner_sales,
				total_visitor: dialy_sale.lunch_visitor + dialy_sale.dinner_visitor
			})
		end
		return new_dialy_sales
	end
end
