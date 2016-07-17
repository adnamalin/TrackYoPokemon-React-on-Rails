  @Pokemon = React.createClass
    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/pokemons/#{ @props.pokemon.id }"
        datatype: 'JSON'
        success: () =>
          @props.handleDeletePokemon @props.pokemon

    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.pokemon.date
        React.DOM.td null, @props.pokemon.name
        React.DOM.td null, combatPointsFormat(@props.pokemon.cp)
        React.DOM.td null,
         React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'DELETE'
