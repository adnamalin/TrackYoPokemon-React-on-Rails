require 'httparty'

class PokemonAPI

  def initialize
    @base_url = "http://pokeapi.co/api/v2"
  end

  def search(pokemon_name)
    cleaned_search = sanitize_search_term(pokemon_name)
    response = HTTParty.get("#{@base_url}/pokemon/#{cleaned_search}")
    p response
    return_basic_info(response)
  end

  private
  def sanitize_search_term(search_term)
    cleaned = search_term.to_s.downcase.tr(" ", "+").chomp
  end

  def return_basic_info(api_response)
    pokemon_info = {}
    pokemon_info[:name] = api_response["name"]
    pokemon_info[:weight] = api_response["weight"]
    pokemon_info[:abilities] = parse_abilities(api_response["abilities"])
    pokemon_info[:image] = api_response["sprites"]["front_default"]
    pokemon_info[:species] = get_species(api_response["species"]["url"])
    pokemon_info[:types] = parse_types(api_response["types"])
    pokemon_info
  end

  def parse_abilities(raw_abilities)
    abilities =[]
    raw_abilities.each do |ability|
      abilities << ability["ability"]["name"]
    end
    abilities
  end

  def parse_types(raw_types)
    types =[]
    raw_types.each do |type|
      types << type["type"]["name"]
    end
    types
  end

  def get_species(api_request_species)
    response = HTTParty.get(api_request_species)
    species_name = response["habitat"]["name"]
  end

end

api = PokemonAPI.new
api.search("dfe")
