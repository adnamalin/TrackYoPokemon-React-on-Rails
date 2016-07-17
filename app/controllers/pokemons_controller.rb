class PokemonsController < ApplicationController

  def index
    @Pokemons = Pokemon.all
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    head :no_content
  end

  private
  def pokemon_params
    params.require(:pokemon).permit(:name, :cp, :date)
  end

end
