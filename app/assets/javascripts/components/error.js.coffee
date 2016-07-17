# hmmm...how to render errors in react? 
@Error = React.createClass
  render: ->
    React.DOM.p
      className: 'error'
      @props.text
