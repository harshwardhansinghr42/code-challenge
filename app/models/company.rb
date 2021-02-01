# frozen_string_literal: true

# Company Model
class Company < ApplicationRecord
  has_rich_text :description
  validate :email_domain

  private
 
  def email_domain
    return unless email.present? && !email.end_with?('@getmainstreet.com')
 
    errors.add(:email, I18n.t('errors.company.email.domain'))
  end

end
