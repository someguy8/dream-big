require "test_helper"

class ReflectionTest < ActiveSupport::TestCase

  test "section fixture exists for foreign key" do
    assert_equal 1, sections(:section).id
    assert_equal sections(:section).id, reflections(:reflection).section_id
  end

  test "goal fixture exists for foreign key" do
    assert_equal 2, goals(:goal).id
    assert_equal goals(:goal).id, reflections(:reflection).goal_id
  end

  test "should save when goal_id(FK) exists in goals table" do
    reflection = Reflection.new
    reflection.goal_id = goals(:goal).id
    assert reflection.save, "reflection not saved"
  end

  test "should error when goal_id(FK) does not exist in goals table" do
    reflection = Reflection.new
    reflection.goal_id = 123456789426
    assert_raises(ActiveRecord::InvalidForeignKey) do reflection.save
    end
  end

  test "should save when section_id(FK) exists in section table" do
    reflection = Reflection.new
    reflection.section_id = sections(:section).id
    assert reflection.save, "reflection not saved"
  end

  test "should error when section_id(FK) does not exist in sections table" do
    reflection = Reflection.new
    reflection.section_id = 123456789426
    assert_raises(ActiveRecord::InvalidForeignKey) do reflection.save
    end
  end
  
  test "all fields should save when goal_id and section_id exist" do
    reflection = Reflection.new
    reflection.goal_id = goals(:goal).id
    reflection.section_id = sections(:section).id
    reflection.reflection_text = "a;sdlkfj asdf2"
    assert reflection.save, "reflection not saved"
  end



end
