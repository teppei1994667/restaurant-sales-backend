class Store < ApplicationRecord
  belongs_to :user
  has_many :dialy_sales
end
