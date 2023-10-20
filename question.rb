class Question
  attr_accessor :question, :answer 
    number1 = rand(1..20)
    number2 = rand(1..20)
    @question = "what is #{number1} + #{number2}?"
    @answer = number1 + number2
  end
end

question = Question.new

puts question.question
puts question.answer
