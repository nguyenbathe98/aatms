class Supervisor::SubjectsController < ApplicationController
  before_action :signed_in?
  before_action :find_subject

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to action: "index"
    else
      redirect_to root_url and return
    end
  end

  def index
    @subjects = Subject.all
  end

  def edit
    redirect_to root_url and return unless @subject
  end

  def show
    redirect_to root_url and return unless @subject
  end

  def update
    @subject.update_attributes(subject_params)
    redirect_to supervisor_subject_path(@subject)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :instruction,
      tasks_attributes: [:id, :name, :instruction, :_destroy])
  end

  def find_subject
    @subject = Subject.find_by id: params[:id]
  end
end
