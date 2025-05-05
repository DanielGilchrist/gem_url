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
        flash_type = @flash.type
        return unless flash_type

        div(class: "alert #{flash_type.css_class}") do
          flash_type.message
        end
      end
    end
  end
end
