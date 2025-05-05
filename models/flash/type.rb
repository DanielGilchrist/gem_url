# typed: strict
# frozen_string_literal: true

module Models
  class Flash
    # @abstract
    class Type
      #: String
      attr_reader :message

      #: (String message) -> void
      def initialize(message)
        @message = message
      end

      # @abstract
      #: -> String
      def css_class; end
    end
  end
end
