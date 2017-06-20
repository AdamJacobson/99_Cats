class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
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

  private
  def cat_params
  end
end
