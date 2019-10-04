require "application_system_test_case"

class AboutUsTest < ApplicationSystemTestCase
  setup do
    @about_u = about_us(:one)
  end

  test "visiting the index" do
    visit about_us_url
    assert_selector "h1", text: "About Us"
  end

  test "creating a About u" do
    visit about_us_url
    click_on "New About U"

    click_on "Create About u"

    assert_text "About u was successfully created"
    click_on "Back"
  end

  test "updating a About u" do
    visit about_us_url
    click_on "Edit", match: :first

    click_on "Update About u"

    assert_text "About u was successfully updated"
    click_on "Back"
  end

  test "destroying a About u" do
    visit about_us_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About u was successfully destroyed"
  end
end
