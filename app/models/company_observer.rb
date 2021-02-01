# frozen_string_literal: true

# Company Observer
class CompanyObserver < ActiveRecord::Observer
  def before_save(company)
    company_city_state(company)
  end

  def company_city_state(company)
    return unless company.will_save_change_to_zip_code?

    place = ZipCodes.identify(company.zip_code)
    return if place.nil?

    company.city = place[:city]
    company.state = place[:state_name]
  end
end
