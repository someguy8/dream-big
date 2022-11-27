require "test_helper"

class CategoryQuestionTest < ActiveSupport::TestCase


  test "categories fixture exists for foreign key" do
    assert_equal 1, categories(:category).id
    assert_equal categories(:category).id, category_questions(:category_question).category_id
  end

  test "should save when category_id(FK) exists in category table" do
    question = CategoryQuestion.new
    question.category_id = categories(:category).id
    assert question.save, "category question not saved"
  end
  
  test "should error when category_id (FK) does not exist in category table" do
    question = CategoryQuestion.new
    question.category_id = 884567894
    assert_raises(ActiveRecord::InvalidForeignKey) do question.save
    end
  end

  test "save all fields" do
    question = CategoryQuestion.new
    question.category_id = categories(:category).id
    question.question = "a question?"
    assert question.save, "reflection not saved"
  end

end
