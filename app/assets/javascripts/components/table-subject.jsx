class TableSubjects extends React.Component{
  constructor(props, context){
    super (props, context);
    this.state = {
      subjects: this.props.subjects,
      course_id: this.props.course_id
    }
  }
  render(){
    return(
      <table>
        <Subjects subjects = {this.state.subjects} course_id = {this.state.course_id} />
      </table>
    )
  };
}

class Subjects extends React.Component{
  render(){
    var subjects = this.props.subjects.map((subject,index) =>{
      return (
        <tr key={index}>
          <td>
            <a href={this.props.course_id+"/subjects/"+subject.id}>
              <div>
                <h1 className="subject_name_incourse">{subject.name}</h1>
                <p className="instruction_subject_incourse">{subject.instruction}</p>
              </div>
            </a>
          </td>
          <td>
            <form action={this.props.course_id+"/subjects/"+subject.id+"/rate_students"} className="evaluate_button">
              <button type="submit">Evaluate</button>
            </form>
          </td>
        </tr>
      )
    })

    return(
      <tbody>
        {subjects}
      </tbody>
    )
  }
}
