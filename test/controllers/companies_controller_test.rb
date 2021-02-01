require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @company = companies(:hometown_painting)
  end

  test "displays all companies" do
    get companies_path
    assert_response :success
  end

  test "displays a single company" do
    get company_path(@company)
    assert_response :success
  end

  test "Show" do
    visit company_path(@company)

    assert_text @company.name
    assert_text @company.phone
    assert_text @company.email
    assert_text @company.city
    assert_text @company.state
  end

  test "Update" do
    visit edit_company_path(@company)

    within("form#edit_company_#{@company.id}") do
      fill_in("company_name", with: "Updated Test Company")
      fill_in("company_zip_code", with: "93009")
      click_button "Update Company"
    end

    text = page.driver.browser.switch_to.alert.text
    assert_equal text, 'Email should only be a @getmainstreet.com domain'
    page.driver.browser.switch_to.alert.dismiss

    within("form#edit_company_#{@company.id}") do
      fill_in("company_email", with: "hometown_painting@getmainstreet.com")
      click_button "Update Company"
    end

    assert_text "Changes Saved"

    @company.reload
    assert_equal "Updated Test Company", @company.name
    assert_equal "93009", @company.zip_code
    assert_equal "hometown_painting@getmainstreet.com", @company.email
  end

  test "Create" do
    visit new_company_path

    within("form#new_company") do
      fill_in("company_name", with: "New Test Company")
      fill_in("company_zip_code", with: "28173")
      fill_in("company_phone", with: "5553335555")
      fill_in("company_email", with: "new_test_company@getmainstreet.com")
      click_button "Create Company"
    end

    assert_text "Saved"

    last_company = Company.last
    assert_equal "New Test Company", last_company.name
    assert_equal "28173", last_company.zip_code
  end

  test "Destroy" do
    visit companies_path
    find("a.delete-company[href='/companies/#{@company.id}']").click
    page.driver.browser.switch_to.alert.accept
    assert_text "Companies"
    assert_text "Wolf Painting"
    assert_no_text "Hometown Painting"
  end 
end
