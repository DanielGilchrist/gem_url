# typed: strict
# frozen_string_literal: true

module Views
  module Components
    class Layout < Phlex::HTML
      #: (Models::Flash flash, ?String title) -> void
      def initialize(flash:, title: "GemURL")
        @title = title
        @flash = flash
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
            # TODO: Handle CSS properly
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

                .alert {
                  padding: 12px 16px;
                  margin-bottom: 20px;
                  border-radius: 4px;
                  font-weight: 500;
                  position: relative;
                  animation: slideDown 0.3s ease-out;
                }

                .alert-success {
                  background-color: #d4edda;
                  color: #155724;
                  border-left: 4px solid #28a745;
                }

                .alert-error, .alert-info {
                  background-color: #f8d7da;
                  color: #721c24;
                  border-left: 4px solid #dc3545;
                }

                @keyframes slideDown {
                  from { transform: translateY(-20px); opacity: 0; }
                  to { transform: translateY(0); opacity: 1; }
                }
              CSS
            end
          end

          body do
            render Views::Shared::Flash.new(@flash)

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
