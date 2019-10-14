import React from 'react';

class Car extends React.Component{
    constructor(props){
        super(props);
        this.brand = props.brand;
        this.model = props.model;
        this.year = props.year;
    }

    static getDerivedStateFromProps(props, state){
        return {brand: props.brand, model: props.model, year: props.year};
    }

    render(){
        return(<div>
            <h1>Brand: {this.brand}</h1>
            <h1>model: {this.model}</h1>
            <h1>Year: {this.year}</h1>
            </div>
            );
    }

    componentDidMount(){
        setTimeout(() => {
            this.setState({brand: "New Brand"});
            this.brand = "New Brand";
            console.log(this.brand);
          }, 2000);
          setTimeout(() => {
            this.setState({model: "New Model"});
            this.model = "New Model";
            console.log(this.model);
          }, 4000);
          setTimeout(() => {
            this.setState({year: "New Year"});
            this.year = 2002;
            console.log(this.year);
          }, 6000);
    }
}

export default Car;