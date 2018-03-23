module Api
  class ApplicationController < ActionController::API
    include Api::Concerns::Responders
  end
end
