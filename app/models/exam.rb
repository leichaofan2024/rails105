class Exam < ApplicationRecord

  has_many :answers

  belongs_to :quiz
  belongs_to :user

end
