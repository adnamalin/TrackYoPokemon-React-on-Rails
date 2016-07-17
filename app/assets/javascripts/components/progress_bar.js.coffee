@ProgressBar = React.createClass
  render: ->
    React.DOM.div
      className: 'progress'
      React.DOM.div
        className: 'progress-bar'
        role: 'progressbar'
        style: progressBarStyle = width: "#{ @props.percent }%"
        @props.percent
