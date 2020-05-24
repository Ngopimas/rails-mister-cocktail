class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all.sort_by &:name
    @count_message = number_cocktails(@cocktails)
  end

  def show
    @cocktail_img = @cocktail.img_url || 'https://source.unsplash.com/random/?cocktail'
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def number_cocktails(cocktails)
    if cocktails.count > 1
      "Enjoy our #{@cocktails.count} cocktails."
    else
      "#{@cocktails.count} cocktail."
    end
  end

  def cocktail_img
    @cocktail = Cocktail.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :image_url)
  end
end
