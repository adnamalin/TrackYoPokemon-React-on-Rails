@Result = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-8'
      React.DOM.div
        className: "panel panel-#{ @props.type }"
        React.DOM.div
          className: 'panel-heading'
          @props.text
        React.DOM.div
          className: 'panel-body result-panel'
          React.DOM.img
            src: @props.image
            height: "150"
          React.DOM.div
            className: 'basic-info'
            React.DOM.h5(null, 'Basic Info')
            React.DOM.ul(null )
              React.DOM.li(null, 'species: '+ @props.species)
              React.DOM.li(null, 'weight: '+ @props.weight)
            React.DOM.h5(null, 'Abilities')
            React.DOM.ul(null )
                for ability in @props.abilities
                  React.DOM.li(null, ability)
            React.DOM.h5(null, 'Type(s)')
            React.DOM.ul(null )
                for type in @props.types
                  React.DOM.li(null, type)
