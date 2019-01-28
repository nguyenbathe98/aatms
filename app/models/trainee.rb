class Trainee < ApplicationRecord
  TEMP_EMAIL_PREFIX = "change@me"
  TEMP_EMAIL_REGEX = /\Achange@me/
  devise :database_authenticatable,
         :recoverable, :rememberable,  :validatable, :omniauthable
  has_many :course_trainees, dependent: :destroy
  has_many :trainee_tasks, dependent: :destroy
  has_many :trainee_subjects, dependent: :destroy
  has_many :courses,  through: :course_trainees
  has_many :tasks,    through: :trainee_tasks
  has_many :subjects, through: :trainee_subjects
  has_many :course_subject_tasks, through: :trainee_tasks
  scope :trainee_data, -> (course){where.not(id: CourseTrainee.select(:trainee_id).where(course: course))}

  validates_format_of :email, without: TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    trainee = signed_in_resource ? signed_in_resource : identity.trainee

    if trainee.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      trainee = Trainee.where(email: email).first if email

      if trainee.nil?
        trainee = Trainee.new(
          name: auth.extra.raw_info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: "password"
        )
        trainee.save!
      end
    end

    if identity.trainee != trainee
      identity.trainee = trainee
      identity.save!
    end
    trainee
  end

  def self.current
    Thread.current[:trainee]
  end
  def self.current=(trainee)
    Thread.current[:trainee] = trainee
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
