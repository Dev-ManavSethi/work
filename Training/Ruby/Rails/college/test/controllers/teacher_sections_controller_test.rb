require 'test_helper'

class TeacherSectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_section = teacher_sections(:one)
  end

  test "should get index" do
    get teacher_sections_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_section_url
    assert_response :success
  end

  test "should create teacher_section" do
    assert_difference('TeacherSection.count') do
      post teacher_sections_url, params: { teacher_section: { section_id: @teacher_section.section_id, teacher_id: @teacher_section.teacher_id } }
    end

    assert_redirected_to teacher_section_url(TeacherSection.last)
  end

  test "should show teacher_section" do
    get teacher_section_url(@teacher_section)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_section_url(@teacher_section)
    assert_response :success
  end

  test "should update teacher_section" do
    patch teacher_section_url(@teacher_section), params: { teacher_section: { section_id: @teacher_section.section_id, teacher_id: @teacher_section.teacher_id } }
    assert_redirected_to teacher_section_url(@teacher_section)
  end

  test "should destroy teacher_section" do
    assert_difference('TeacherSection.count', -1) do
      delete teacher_section_url(@teacher_section)
    end

    assert_redirected_to teacher_sections_url
  end
end
