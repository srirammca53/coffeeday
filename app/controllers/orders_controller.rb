class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

	def new
		@order = Order.new
  end

	def edit
		@order = Order.find(params[:id])
  end

  def create
  	@order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
    	render "new"
    end
  end

  def update
	  @order = Order.find(params[:id])

	  if @order.update(order_params)
	    redirect_to @order
	  else
	    render 'edit'
	  end
	end

  def show
    @order = Order.find(params[:id])
  end

  def notify
    @order = Order.find(params[:order_id])
    @order.notified = true
    @order.save
    redirect_to orders_path
  end

  def deliver
    @order = Order.find(params[:order_id])
    @order.status = "Delivered"
    @order.save
    redirect_to orders_path
  end
  private
    def order_params
      params.require(:order).permit(:customer_name, :mobile, :status, :notified)
    end
end
