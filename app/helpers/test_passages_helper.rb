module TestPassagesHelper
  def success_rate
    @test_passage.correct_questions.to_f / @test_passage.test.questions.count * 100
  end
end
