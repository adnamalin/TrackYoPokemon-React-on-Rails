@Result = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-4'
      React.DOM.div
        className: "panel panel-#{ @props.type }"
        React.DOM.div
          className: 'panel-heading'
          @props.text
        React.DOM.div
          className: 'panel-body'
          React.DOM.img
            src: @props.image
          React.DOM.ul
            React.DOM.li(null, 'species: '+ @props.species)
            React.DOM.li(null, 'weight: '+ @props.weight)
