class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:index, :show]
    

    protect_from_forgery with: :exception
  




  private

  def set_order
    @order = Order.find(session[:order_id])
    if @order <= 0
      @order = Order.create(session[:order_id] = @order.id)
    
    end
  end


end