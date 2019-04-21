# frozen_string_literal: true

module Web
  module Users
    class FamilyMembersController < ::Web::Users::ApplicationController
      def new
        @family_member = resource_user.family_members.new
      end

      def create
        member = resource_user.family_members.create(permitted_params)
        respond_with member, location: -> { user_path(current_user) }
      end

      def edit
        @family_member = resource_user.family_members.find(params[:id])
      end

      def update
        member = resource_user.family_members.find(params[:id])

        member.update(permitted_params)
        respond_with member, location: -> { user_path(current_user) }
      end

      def destroy
        member = resource_user.family_members.find(params[:id])

        member.destroy
        respond_with member, location: -> { user_path(current_user) }
      end

      private

      def permitted_params
        params.require(:user_family_member).permit(:first_name, :last_name, :patronymic, :birthdate, :kinship)
      end
    end
  end
end
