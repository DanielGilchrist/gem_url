# typed: strict
# frozen_string_literal: true

require "phlex"
require_relative "layout"

module Views
  module Components
    class Home < Phlex::HTML
      #: -> void
      def view_template
        render Layout.new do
          h2 { "Shorten your URL" }
          p { "Turn long URLs into gems of brevity!" }

          form action: "/shorten", method: "post" do
            input type: "text", name: "url", placeholder: "Enter a URL to shorten", size: 50, required: true
            button type: "submit" do
              "Create GemURL"
            end
          end
        end
      end
    end
  end
end
