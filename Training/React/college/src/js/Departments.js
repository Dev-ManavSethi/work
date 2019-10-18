import React from 'react';
class Departments extends React.Component {
    constructor(props){
        super(props)
        this.state = {error: null, isLoaded: false, departments: []};
    }
    
    render() {
        const { error, isLoaded, departments } = this.state;
        if (error) {
          return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
          return <div>Loading...</div>;
        } else {
          return (
              <div>
              <h1>Departments</h1>
            <ul>
              {departments.map(department => (
                <li key={department.id}>
                  {department.name} {department.hod_id}
                </li>
              ))}
            </ul>
            </div>
          );
        }
    }

    componentDidMount() {
        fetch("http://localhost:3001/api/departments?auth=abc")
          .then(res => res.json())
          .then(
            (result) => {
                console.log(result);
              this.setState({
                isLoaded: true,
                departments: result.data
              });
            },
            
            (error) => {
              this.setState({
                isLoaded: true,
                error
              });
            }
          )
      }
}

export default Departments;