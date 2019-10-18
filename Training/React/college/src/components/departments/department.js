import React from 'react';
class Department extends React.Component {
    constructor(props){
        super(props)
        this.state = {error: null, isLoaded: false, departments: []};
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

      render() {
        const { error, isLoaded, departments } = this.state;
        if (error) {
          return <div>Error: {error.message}</div>;
        } else if (!isLoaded) {
          return <div>Loading...</div>;
        } else {
          return (
              <div>
              <h1>Department</h1>
            <table>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>HOD ID</th>
              </tr>
              
              {departments.map(department => (
                <tr>
                <td>{department.id} </td>
                <td>{department.name}</td>
                <td>{department.hod_id}</td>
              </tr>
              ))}
            </table>
            </div>
          );
        }
    }
}

export default Department;