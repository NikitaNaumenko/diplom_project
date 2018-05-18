# frozen_string_literal: true

def parsed_json_body
  JSON.parse(@response.body)
end
