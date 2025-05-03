# typed: strict
# frozen_string_literal: true

module Views
  module Shared
    class Flash < Phlex::HTML
      #: (Models::Flash flash) -> void
      def initialize(flash)
        @flash = flash
      end

      #: -> void
      def view_template
        return if @flash.empty?

        if (message = @flash.success)
          div(class: "alert alert-success") do
            message
          end
        end

        if (message = @flash.failure)
          div(class: "alert alert-info") do
            message
          end
        end
      end
    end
  end
end
