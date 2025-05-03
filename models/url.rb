# typed: strict
# frozen_string_literal: true

module Models
  class URL
    class << self
      #: (String original_url, String short_code) -> instance
      def insert(original_url, short_code)
        DB.execute(
          "INSERT INTO urls (original_url, short_code) VALUES (?, ?)",
          [original_url, short_code]
        )

        new(original_url, short_code)
      end

      #: (String short_code) -> instance?
      def find(short_code)
        result = DB.execute(
          "SELECT original_url FROM urls WHERE short_code = ?",
          [short_code]
        ).first
        return if result.nil?

        original_url = result.fetch("original_url")
        new(original_url, short_code)
      end
    end

    #: String
    attr_reader :original_url, :short_code

    #: (String original_url, String short_code) -> void
    def initialize(original_url, short_code)
      @original_url = original_url
      @short_code = short_code
    end
  end
end
