module ApplicationHelper

  def order_count_over_one
    return total_order_items if total_order_items > 0
  end

  def total_order_items
   total = @order.line_items.map(&:quantity).sum
    return total if total > 0
  end
end

