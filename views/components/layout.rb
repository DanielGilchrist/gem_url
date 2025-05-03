# typed: strict
# frozen_string_literal: true

require "phlex"

module Views
  module Components
    class Layout < Phlex::HTML
      #: (?String) -> void
      def initialize(title: "GemURL")
        @title = title
      end

      #: ?{ -> void } -> void
      def view_template(&block)
        doctype
        html do
          head do
            meta charset: "utf-8"
            meta name: "viewport", content: "width=device-width, initial-scale=1"
            title { @title }
            link rel: "stylesheet", href: "https://cdn.jsdelivr.net/npm/water.css@2/out/water.css"
            style do
              <<~CSS
                body {
                  max-width: 800px;
                  margin: 0 auto;
                  padding: 20px;
                }
                .ruby-logo {
                  color: #CC342D;
                  font-weight: bold;
                }
              CSS
            end
          end
          body do
            h1 do
              a(href: "/", class: "ruby-logo") { "GemURL" }
            end
            yield if block_given?
          end
        end
      end
    end
  end
end
