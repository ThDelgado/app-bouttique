class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]
  before_action :update, only: %i[index]




  def add_product (product_id,quantity, price)
    @product = Product.find(product_id)
    @quantity = quantity.to_i
    @price = price.to_f
    respond_to
    if  @productr && @quantity > 0
      OrderItem.create(product_id: @product, quanttity:@quantity, price: @price)
    end
  end

  def update (product, quantity, price)
    @product = product.to_i
    @quantity = quantity.to_i
    @price = price.to_f
  

    if @product && @quantity > 0
      OrderItem.create(product_id: @product, quantity: @quantity, price: @price)
      compute_total
    end

   
  end
  


  def compute_total (price)
    sum = 0
    @price = []
    @price.push price
    @price.each do |item|
      @total =sum += item.price
    end
    @total
  end



  

  # GET /line_items or /line_items.json
  def index 
    @order = current_order
  end
   


  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:products_id])
    @line_item = @order.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.order, notice: "Item added to order." }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
   
    @order= Order.find(session(:order_id))
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to order_path(@cart), notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :quantity, :price )
    end
end
