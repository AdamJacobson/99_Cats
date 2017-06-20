class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = current_cat
    if @cat
      render :show
    else
      render json: 'cannae find cat', status: 404
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = current_cat
    render :edit
  end

  def update
    @cat = current_cat
    if @cat.update_attributes(cat_pawrams)
      redirect_to cat_url(@cat)
    else
      render json: 'cannae update cat', status: 404
    end
  end

  def create
    @cat = Cat.new(cat_pawrams)
    if @cat.save
      redirect_to cats_url
    else
      render json: 'cannae find cat', status: 404
    end
  end


  private

  def current_cat
    Cat.find_by(id: params[:id])
  end

  def cat_pawrams
    params.require(:cat).permit(:name, :sex, :birth_date, :description, :color)
  end
end
