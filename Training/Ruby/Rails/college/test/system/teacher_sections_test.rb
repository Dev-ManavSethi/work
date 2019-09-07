require "application_system_test_case"

class TeacherSectionsTest < ApplicationSystemTestCase
  setup do
    @teacher_section = teacher_sections(:one)
  end

  test "visiting the index" do
    visit teacher_sections_url
    assert_selector "h1", text: "Teacher Sections"
  end

  test "creating a Teacher section" do
    visit teacher_sections_url
    click_on "New Teacher Section"

    fill_in "Section", with: @teacher_section.section_id
    fill_in "Teacher", with: @teacher_section.teacher_id
    click_on "Create Teacher section"

    assert_text "Teacher section was successfully created"
    click_on "Back"
  end

  test "updating a Teacher section" do
    visit teacher_sections_url
    click_on "Edit", match: :first

    fill_in "Section", with: @teacher_section.section_id
    fill_in "Teacher", with: @teacher_section.teacher_id
    click_on "Update Teacher section"

    assert_text "Teacher section was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher section" do
    visit teacher_sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher section was successfully destroyed"
  end
end
