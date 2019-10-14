import React from 'react';
import logo from './logo.svg';
//import './Elements.css';

class Heading extends React.Component{
    constructor(heading){
        super();
        this.text = heading;
    }

    render(){
        return(<h1>{this.text}</h1>);
    }
}

class SubHeading extends React.Component{
    constructor(subHeading){
        super();
        this.text = subHeading;
    }
    render(){
        return(<h2>{this.text}</h2>);
    }
}

class Paragraph extends React.Component{
    constructor(para){
        super();
        this.text = para;
    }
    render(){
        return(<p>{this.text}</p>);
    }
}

class OrderedList extends React.Component{
    constructor(heading , ...items){
        super();
        this.heading = heading;
        this.items = items;
    }

    render(){
        let listItems = this.items.map((items) => <li key={items}>{items}</li>);
        return (
            <section><ol>
            <h4>{this.heading}</h4></ol>
            <ol>
            {listItems }
            </ol>
            </section>
          );
    }

    append(item){
        this.items.push(item);
    }
}

class UnorderedList extends React.Component{
    constructor(heading,...items){
        super();
        this.heading = heading;
        this.items = items;
    }

    render(){
        let listItems = this.items.map((items) => <li key={items}>{items}</li>);
        return (  
            <section> 
            <ul><h4>{this.heading}</h4></ul>     
            <ul>
            {listItems }
            </ul>
            </section>
          );
    }

    append(item){
        this.items.push(item);
    }
}

class Form extends React.Component{
    constructor(){
        super();
    }
}

export {Heading, SubHeading, Paragraph, OrderedList, UnorderedList};