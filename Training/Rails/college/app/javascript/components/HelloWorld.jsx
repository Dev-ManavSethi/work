import React from "react"
import PropTypes from "prop-types"

class HelloWorld extends React.Component {
  constructor(props){
    super(props);
  }

  render () {
    return (
      <div><h1>Greeting is </h1></div>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
