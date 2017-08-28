class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorise

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :title,
      :description,
      :image,
      category_ids: []
    )
  end

  def authorise
    return redirect_to signup_path unless current_user
  end
end
