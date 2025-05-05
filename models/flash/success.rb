# typed: strict
# frozen_string_literal: true

module Models
  class Flash
    class Success < Type
      # @override
      #: -> String
      def css_class
        "alert-success"
      end
    end
  end
end
