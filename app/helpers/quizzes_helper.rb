module QuizzesHelper
  def total_count(answer)
    sum = 0
     answer.each do |f|
      if f.is_correct == f.question.is_correct
        sum += 1
      end
    end
    sum
  end

end
