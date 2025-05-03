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
          div(style: "max-width: 600px; margin: 0 auto;") do
            h2 { "Your shortened URL" }
            div(style: "background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 5px; margin-bottom: 2rem;") do
              a(href: shortened_url, target: "_blank",
                style: "color: #4a9df8; font-size: 1.2rem; word-break: break-all;") do
                shortened_url
              end
            end

            h2 { "Original URL" }
            div(style: "background: rgba(255,255,255,0.03); padding: 0.8rem; border-radius: 5px; margin-bottom: 2rem;") do
              a(href: @url.original_url, target: "_blank", style: "color: #aaa; word-break: break-all;") do
                @url.original_url
              end
            end

            div(style: "margin-top: 2rem; text-align: center;") do
              a(
                href: "/",
                role: "button",
                style: "background-color: #CC342D; color: white; font-size: 1.1rem; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block;"
              ) do
                "Shorten another URL?"
              end
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
