class CommentTraineeSubjects extends React.Component {
  constructor(props,context){
    super(props,context);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      hideToolTip: false,
      comment: ''
    }
  }

  handleChange(event){
    this.setState({
      comment: event.target.value
    })
  }

  handleSubmit(event){
    event.preventDefault();
    var course_id = this.props.course.id;
    var subject_id = this.props.subject.id;
    var trainee_subject_id = this.props.trainee_subject.id;
    var value = this.state.comment;
    this.setState({hideToolTip: true});
    $.ajax({
      type: 'PUT',
      url: '/trainer/courses/'+course_id+'/subjects/'+subject_id+'/rate_students/'+trainee_subject_id,
      data: {
        trainee_subject_id: {trainee_subject_id , comment: value}
      }
    }); 
  }

  render(){
    const style = this.state.hideToolTip ? {display: 'none'} : {};
    return(
      <div>
        Comment: {this.state.comment}
        <div style={style}>
          <form onSubmit = {event => this.handleSubmit(event)}>
            <input type="text" placeholder="Comment..." onChange = {this.handleChange} value={this.state.comment}/>
            <button type="submit">Comment</button>
          </form>
        </div>
      </div>
    )
  };
}