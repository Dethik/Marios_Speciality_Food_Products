class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search]
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
    elsif params[:sort_alpha]
      @products = Product.order("name")
    else
      @products = Product.order("name")
    end
    render :index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully destroyed!"
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :country, :price)
  end
end