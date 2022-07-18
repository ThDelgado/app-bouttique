class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_order

    protect_from_forgery with: :exception

  def add_product(product)
    current_item = 0

    current_item = LineItem.find(product: product.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = LineItem.creat(product_id: product.id)
    end
    current_item
  end
  
  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create
    session[:order_id] = @order.id
  end

    
    

   
  def order_count_over_one
    return total_order_items if total_cart_items > 0
  end

  def total_order_items
    total = @order.line_items.map(&:quantity).sum
    return total if total > 0
  end
 
    private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
   

  
  def total_price
    instrument.price.to_i * quantity.to_i
  end
end