module Supervisor::SubjectsHelper
  def all_subjects
    Subject.all.in_groups_of((Subject.count.to_f/3).ceil)
  end
end
