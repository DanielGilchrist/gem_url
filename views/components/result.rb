# typed: strict
# frozen_string_literal: true

module Views
  module Components
    class Result < Phlex::HTML
      #: (Models::URL url, String base_url) -> void
      def initialize(url:, base_url:)
        @url = url
        @base_url = base_url
      end

      #: -> void
      def view_template
        render Layout.new do
          h2 { "Your shortened URL: #{shortened_url}" }
          p { "Original URL: #{@url.original_url}" }
          p do
            a(href: "/") { "Shorten another URL" }
          end
        end
      end

      private

      #: -> String
      def shortened_url
        "#{@base_url}/#{@url.short_code}"
      end
    end
  end
end
