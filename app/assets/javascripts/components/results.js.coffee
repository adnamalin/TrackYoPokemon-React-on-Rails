@Results = React.createClass
  getInitialState: ->
    results: @props.data

  getDefaultProps: ->
    results: []

  render: ->
    React.DOM.div
      className: 'results'
      React.DOM.h2
        className: 'title'
        'Search Results'
    React.DOM.div
      className: 'row'
      for result in @state.results
        React.createElement Result, type: 'primary', species: result.species, weight: result.weight, image: result.image ,abilities: result.abilities, types: result.types, text: result.name
