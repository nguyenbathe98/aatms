class Scores extends React.Component{
  constructor(props,context){
    super(props, context);
    this.state = {
      scores: this.props.scores,
      trainee_subject: this.props.trainee_subject
    }
  }
  render(){
    return(
      this.state.scores.map((score,index) =>{
        return(
            <form action={"trainer/courses/"+this.props.course.id+"/subjects"+this.props.subject.id+"/rate_student/"+this.state.trainee_subject.id} className="button_score" key={index}>
              <button type="submit">{score}</button>
            </form>
        )
      })
    )    
  };
}