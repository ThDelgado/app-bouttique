class Order < ApplicationRecord
 
  belongs_to :user
  
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item > 0
      current_item.increment(:quantity)
    else
      current_item = line_items.new(product_id: product.id)
    end
  end

  def total_price 
    line_items.to.a.sum {|item| item +=  }
  end
 


end
