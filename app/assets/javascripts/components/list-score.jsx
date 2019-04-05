var globalscore;
class ButtonScores extends React.Component{
  constructor(props, context){
    super(props, context);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.state = {
      scores: this.props.scores,
      hideToolTip: false,
      finalscore: ''
    }
  }
  handleSubmit(score,e){
    e.preventDefault();
    var course_id = this.props.course.id;
    var subject_id = this.props.subject.id;
    var trainee_subject_id = this.props.trainee_subject.id;
    this.setState({hideToolTip: true, finalscore: score.score});
    $.ajax({
      type: 'PUT',
      url: '/trainer/courses/'+course_id+'/subjects/'+subject_id+'/rate_students/'+trainee_subject_id,
      data: {
        trainee_subject_id: {trainee_subject_id, score: score.score}
      }
    }); 
  }
  render(){
    var scores = this.state.scores.map((score,index) => {
      return(
        <form onSubmit={event => this.handleSubmit({score},event)}  className="button_score" key={index}>
          <button type="submit">{score}</button>
        </form>
      )
    })

    const style = this.state.hideToolTip ? {display: 'none'} : {};
    return(
      <div>
        Score: {this.state.finalscore}
        <div style={style} className="listscores">
          {scores}
        </div>
      </div>
    )
  };
}

class ListScores extends React.Component{
  constructor(props,context){
    super(props,context);
  }

  render(){
    return(
      <div>
        <ButtonScores scores = {this.props.scores} course = {this.props.course} subject = {this.props.subject} trainee_subject = {this.props.trainee_subject}/>
      </div>
    )
  };
}