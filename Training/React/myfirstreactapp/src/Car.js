import React from 'react';

class Car extends React.Component{


    constructor(props){
        super(props);
        this.state = {brand: props.brand, model: props.model, year: props.year};
    }

    static getDerivedStateFromProps(props, state){
        //return {brand: props.brand, model: props.model, year: props.year}; //makes Car immutable
    }

    render(){
        return(<div>
            <h1>Brand: {this.state.brand}</h1>
            <button type="button" onClick={this.changeBrand}>Change Brand</button>
            <h1>model: {this.state.model}</h1>
            <h1>Year: {this.state.year}</h1>
            
            </div>
            );
    }

    componentDidMount(){
        setTimeout(() => {
            this.setState({brand: "New Brand"});
          }, 2000);
          setTimeout(() => {
            this.setState({model: "New Model"});
          }, 4000);
          setTimeout(() => {
            this.setState({year: "New Year"});
          }, 6000);
    }

    shouldComponentUpdate() {
        return true;
      }

    changeBrand = () => {
        this.setState({brand: "New Brandddd"});
    }
}

export default Car;