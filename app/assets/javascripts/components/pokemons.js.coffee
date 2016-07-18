@Pokemons = React.createClass
  getInitialState: ->
    pokemons: @props.data

  getDefaultProps: ->
    pokemons: []

  addPokemon: (pokemon) ->
      pokemons = @state.pokemons.slice()
      pokemons.push pokemon
      @setState pokemons: pokemons

  deletePokemon: (pokemon) ->
      pokemons = @state.pokemons.slice()
      index = pokemons.indexOf pokemon
      pokemons.splice index, 1
      @replaceState pokemons: pokemons

  caughtPokedex: ->
    @state.pokemons.length

  uncaughtPokedex: ->
    133 - @caughtPokedex()

  plusCP: ->
    postive = @state.pokemons.filter (val) -> val.cp >= 0
    postive.reduce ((prev, curr) ->
      prev + parseFloat(curr.cp)
    ), 0

  minusCP: ->
      negative = @state.pokemons.filter (val) -> val.cp < 0
      negative.reduce ((prev, curr) ->
        prev + parseFloat(curr.cp)
      ), 0

  totalCP: ->
    @plusCP() + @minusCP()

  percentage: ->
    Number(Math.round((@caughtPokedex()/@uncaughtPokedex())*100)).toLocaleString()

  render: ->
    React.DOM.div
      className: 'pokemons'
      React.DOM.h2
        className: 'title'
        'All Yo Pokemon'
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', cp: @caughtPokedex(), text: 'Pokemon Caught'
        React.createElement AmountBox, type: 'danger', cp: @uncaughtPokedex(), text: 'Pokemon Left to Catch'
        React.createElement AmountBox, type: 'info', cp: @totalCP(), text: 'Total Combat Points'
      React.DOM.p(null, 'PokeProgress:')
      React.createElement ProgressBar, percent: @percentage()
      React.createElement PokemonForm, handleNewPokemon: @addPokemon
        # get the json of the new pokemon from the form and then runns its won addPokemon method
      React.DOM.br(null )
      React.DOM.table
        className: 'table table-bordered table-hover'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Combat Points'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for pokemon in @state.pokemons
            React.createElement Pokemon, key: pokemon.id, pokemon: pokemon, handleDeletePokemon: @deletePokemon


#Another way to instantiate ReactComponents inside the render method is through JSX syntax. The following snippet is equivalent to the previous one:
#f you are trying to integrate React into an existing application built with erb, you have the option to reuse your existing erb code and convert it into JSX.
# render: ->
#     `<div className="records">
#       <h2 className="title"> Records </h2>
#     </div>`
