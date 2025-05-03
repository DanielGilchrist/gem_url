# typed: strict
# frozen_string_literal: true

require "phlex"
require_relative "layout"

module Views
  module Components
    class Result < Phlex::HTML
      #: (String original_url) -> void
      def initialize(original_url:)
        @original_url = original_url
      end

      #: -> void
      def view_template
        render Layout.new do
          h2 { "Your shortened URL" }
          p { "Original URL: #{@original_url}" }
          p { "We'll implement the actual shortening later!" }
          p do
            a(href: "/") { "Shorten another URL" }
          end
        end
      end
    end
  end
end
