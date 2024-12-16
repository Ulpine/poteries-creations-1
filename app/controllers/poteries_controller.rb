class PoteriesController < ApplicationController
  def index
    @poteries = Poterie.all
  end

  def show
    @poterie = Poterie.find(params[:id])
  end

  def new
    @poterie = Poterie.new
  end

  def create
    @poterie = Poterie.new(poterie_params)
    if @poterie.save
      redirect_to @poterie
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def poterie_params
    params.require(:poterie).permit(:artist, :description, :technique, :categorie, :photo)
  end
end
