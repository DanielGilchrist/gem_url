# typed: strict
# frozen_string_literal: true

module Actions
  class Shorten < Base
    post "/shorten" do
      original_url = params[:url]
      return redirect_home if url.blank?
      return redirect_home unless valid_url?(original_url)

      code = generate_code
      url = Models::URL.insert(original_url, code)

      phlex Views::Components::Result.new(url:, base_url: request.base_url)
    end

    private

    #: -> String
    def generate_code
      code = SecureRandom.alphanumeric(10)
      url = Models::URL.find(code)
      return generate_code if url

      code
    end
  end
end
