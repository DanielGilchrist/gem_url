# typed: strict
# frozen_string_literal: true

require_relative "base"
require_relative "../views/components/result"

module Actions
  class Shorten < Base
    post "/shorten" do
      phlex Views::Components::Result.new(original_url: params[:url])
    end
  end
end
