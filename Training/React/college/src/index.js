import React from 'react';
import ReactDOM from 'react-dom';

import Home from './components/home/home';
import About from './components/about/about';
import AllDepartments from './components/departments/all_departments';

import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
  } from "react-router-dom";


const router = (
  <Router>
    <div>
      <ul>
        <li>
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="/about">About</Link>
        </li>
        <li>
          <Link to="/departments">Departments</Link>
        </li>
      </ul>
      <Route exact path="/" component={Home} />
      <Route path="/about" component={About} />
      <Route path="/departments" component={AllDepartments} />
    </div>
  </Router>
)

ReactDOM.render(router, document.getElementById('root'))


//serviceWorker.unregister();
