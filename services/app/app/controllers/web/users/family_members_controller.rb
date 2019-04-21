# frozen_string_literal: true

module Web
  module Users
    class FamilyMembersController < ::Web::Users::ApplicationController
      def new
        @family_member = resource_user.family_members.new
      end

      def create
        resource_user.family_members.create(permitted_params)
      end

      private

      def permitted_params
        params.require(:user_family_member).permit(:first_name, :last_name, :patronymic, :birthdate)
      end
    end
  end
end
