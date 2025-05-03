# typed: strict
# frozen_string_literal: true

module Views
  module Components
    class Result < Phlex::HTML
      #: (Models::Flash flash, Models::URL url, String base_url) -> void
      def initialize(flash:, url:, base_url:)
        @flash = flash
        @url = url
        @base_url = base_url
      end

      #: -> void
      def view_template
        render Layout.new(flash: @flash) do
          h2 { "Your shortened URL" }

          url = shortened_url
          a(href: url) { url }

          h2 { "Original URL" }
          a(href: @url.original_url) { @url.original_url }

          div(style: "margin-top: 2rem;") do
            form(action: "/", method: "get") do
              input(type: "submit", value: "Shorten another URL?")
            end
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
