class ProductsController < ApplicationController
  def new
    @product=Product.new
  end

  def index
    @products=Product.all
  end

  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def description
    @product=Product.find_by(id:params[:id])
    if @product
      render plain: @product.description
    else
      redirect "/products"
    end
  end

  def inventory
    @product=Product.find_by(id:params[:id])
    if @product
      render plain: @product.inventory > 0
    else
      redirect "/products"
    end
  end

  def product_params
    params.require(:product).permit(:name,:price,:inventory,:description)
  end
end
