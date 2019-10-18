import React from 'react';
import ReactDOM from 'react-dom';
import Home from './js/Home';
import About from './js/About';
import Departments from './js/Departments';

import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
  } from "react-router-dom";

  export default function RouteNavigator() {
    return (
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
  
          <hr />
  
          <Switch>
            <Route exact path="/">
              <Home />
            </Route>
            <Route path="/about">
              <About />
            </Route>
            <Route path="/departments">
              <Departments />
            </Route>
            {/* <Route path="/sections">
              <Sections />
            </Route> */}
          </Switch>
        </div>
      </Router>
    );
  }

ReactDOM.render(
<Home />,
document.getElementById('root')
);

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
//serviceWorker.unregister();
