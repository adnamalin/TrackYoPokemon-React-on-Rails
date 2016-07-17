  @Pokemon = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.pokemon.date
        React.DOM.td null, @props.pokemon.name
        React.DOM.td null, combatPointsFormat(@props.pokemon.cp)
