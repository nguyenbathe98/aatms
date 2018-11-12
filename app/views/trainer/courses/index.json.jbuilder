json.courses do
  json.array!(@courses) do |course|
    json.name course.name
    json.url trainer_course_path(course)
  end
end
