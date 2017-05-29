class Exam < ApplicationRecord

  has_many :answers

  belongs_to :quizzes
  belongs_to :users
  
end
