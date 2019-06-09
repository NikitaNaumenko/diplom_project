require 'application_responder'

# frozen_string_literal: true

# Main controller
class ApplicationController < ActionController::Base
  include Pundit

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
end
