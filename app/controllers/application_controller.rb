# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  def errors(obj)
    obj.errors.full_messages.join(', ')
  end
end
