# @Pokemons = React.createClass
#   render: ->
#     React.DOM.div
#       classNAME: 'pokemons'
#       React.DOM.h2
#         classNAME: 'name'
#         'Pokemon'

@Pokemons = React.createClass
  getInitialState: ->
    pokemons: @props.data

  getDefaultProps: ->
    pokemons: []

  addPokemon: (pokemon) ->
      pokemons = @state.pokemons.slice()
      pokemons.push pokemon
      @setState pokemons: pokemons

  render: ->
    React.DOM.div
      className: 'pokemons'
      React.DOM.h2
        className: 'title'
        'All Yo Pokemon'
      React.createElement PokemonForm, handleNewPokemon: @addPokemon
      # get the json of the new pokemon from the form and then runns its won addPokemon method
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Combat Points'
        React.DOM.tbody null,
          for pokemon in @state.pokemons
            React.createElement Pokemon, key: pokemon.id, pokemon: pokemon


#Another way to instantiate ReactComponents inside the render method is through JSX syntax. The following snippet is equivalent to the previous one:
#f you are trying to integrate React into an existing application built with erb, you have the option to reuse your existing erb code and convert it into JSX.
# render: ->
#     `<div className="records">
#       <h2 className="title"> Records </h2>
#     </div>`
