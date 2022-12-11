class ProductsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @product = @order.products.create(product_params)
    redirect_to order_path(@order)
    @order.total_price = @order.products.map{|x| x.qty * Item.find(x.item).price }.sum
    @order.total_tax = @order.products.map{|x| (x.qty * Item.find(x.item).price*18)/100 }.sum
    @order.bill_amount = @order.total_price + @order.total_tax
    @order.save!
  end

  private
    def product_params
      params.require(:product).permit(:item, :qty, :price)
    end
end
