class PokemonsController < ApplicationController


def index
  @Pokemons = Pokemon.all
end

end
