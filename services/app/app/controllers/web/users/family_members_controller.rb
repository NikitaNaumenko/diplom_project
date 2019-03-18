# frozen_string_literal: true

module Web
  module Users
    class FamilyMembersController < ::Web::Users::ApplicationController
      def new
        @family_member = resource_user.family_members.new
      end

      def create
        resource_user.family_members.create(params[:user_family_member])
      end
    end
  end
end
