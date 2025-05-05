# typed: strict
# frozen_string_literal: true

module Models
  class Flash
    class Failure < Type
      # @override
      #: -> String
      def css_class
        "alert-failure"
      end
    end
  end
end
