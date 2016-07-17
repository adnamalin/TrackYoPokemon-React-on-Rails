@ProgressBar = React.createClass
  render: ->
    React.DOM.div
      className: 'progress'
      React.DOM.div
        className: 'progress-bar progress-bar-danger progress-bar-striped active'
        role: 'progressbar'
        style: progressBarStyle = width: "#{ @props.percent }%"
        @props.percent + '%'
