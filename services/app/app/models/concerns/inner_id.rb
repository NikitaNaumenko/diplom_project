# frozen_string_literal: true

module InnerId
  extend ActiveSupport::Concern

  included do
    private

    def next_inner_id(options = {})
      return unless self.respond_to?(:inner_id)
      scope = self.send(options[:scope])
      last_record = scope.send(self.model_name.plural).last
      self.inner_id = last_record.present? ? last_record.inner_id.next : 1
    end
  end
end
