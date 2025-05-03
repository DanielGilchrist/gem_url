# typed: strict
# frozen_string_literal: true

module Views
  module Components
    class Home < Phlex::HTML
      #: (Models::Flash flash, String base_url) -> void
      def initialize(flash:, base_url:)
        @flash = flash
        @base_url = base_url
      end

      #: -> void
      def view_template
        render Layout.new(flash: @flash) do
          div(style: "text-align: center; max-width: 600px; margin: 2rem auto;") do
            h2(style: "font-size: 2.2rem; margin-bottom: 0.5rem;") { "Shorten your URL" }
            p(style: "font-size: 1.1rem; margin-bottom: 1.5rem; color: #aaa;") do
              "Turn long URLs into gems of brevity!"
            end

            form(action: "/shorten", method: "post", style: "margin: 2rem auto;") do
              div(style: "display: flex; flex-direction: column; gap: 0.8rem;") do
                input(
                  type: "text",
                  name: "url",
                  placeholder: "Enter a URL to shorten",
                  required: true,
                  style: "font-size: 1.1rem; padding: 10px; width: 100%;"
                )
                button(
                  type: "submit",
                  style: "background-color: #CC342D; color: white; font-size: 1.1rem; padding: 10px;"
                ) do
                  "Create GemURL"
                end
              end
            end

            div(style: "margin-top: 1.5rem; font-size: 0.9rem; color: #aaa; background: rgba(255,255,255,0.05); padding: 1rem; border-radius: 5px;") do
              p(style: "margin: 0;") do
                plain "Example: "
                br
                span(style: "word-break: break-all;") { "https://github.com/verylongpath/repository" }
                br
                plain "→"
                br
                span(style: "color: #CC342D;") { "#{@base_url}/5CWCxebbd1" }
              end
            end
          end
        end
      end
    end
  end
end
