  @PokemonForm = React.createClass
    getInitialState: ->
      name: ''
      date: ''
      cp: ''

    valid: ->
      @state.name && @state.date && @state.cp

    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value

    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { pokemon: @state }, (data) =>
        # passing the response (the json sent back from controller) to pokemons.js.coffee's handleNewPokemon method
        @props.handleNewPokemon data
        # resets itself (the form) intial empty state
        @setState @getInitialState()
      , 'JSON'


    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Name'
            name: 'name'
            value: @state.name
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Combat Points'
            name: 'cp'
            value: @state.cp
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Add Pokemon'
