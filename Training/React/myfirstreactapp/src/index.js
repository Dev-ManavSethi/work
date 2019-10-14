import React from 'react';
import ReactDOM from 'react-dom';

import './index.css';

import {Heading, SubHeading, Paragraph, OrderedList, UnorderedList} from './Elements';

import * as serviceWorker from './serviceWorker';
import Car from './Car';



var mainPageHeading = new Heading("Hello World!");
var mainPageSubHeading = new SubHeading("This is a sub heading");
var paragrapgh = new Paragraph("This is a paragrapgh");
var ol = new OrderedList("Ordered List:","one", "two", "three");
var ul = new UnorderedList("UnOrdered List:", "one", "two", "three")

ReactDOM.render( mainPageHeading.render(), document.getElementById('heading'));
ReactDOM.render( mainPageSubHeading.render(), document.getElementById('sub_heading'));
ReactDOM.render(paragrapgh.render(), document.getElementById('para'));
ReactDOM.render(ol.render(), document.getElementById('ol'));

ol.append("four");

ReactDOM.render(ol.render(), document.getElementById('ol'));
ReactDOM.render(ul.render(), document.getElementById('ul'));

ul.append("five");
ul.append("six");

ReactDOM.render(ul.render(), document.getElementById('ul'));

ReactDOM.render(<Car brand="Ford" model="Mustang" year="2000"/>, document.getElementById('car'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.register();
