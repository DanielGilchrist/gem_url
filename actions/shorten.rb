# typed: strict
# frozen_string_literal: true

module Actions
  class Shorten < Base
    post "/shorten" do
      original_url = params[:url]

      if original_url.blank?
        flash.failure = "URL cannot be blank!"
        return redirect_home
      end

      unless valid_url?(original_url)
        flash.failure = "#{original_url} is not a valid URL!"
        return redirect_home
      end

      code = generate_code
      url = Models::URL.insert(original_url, code)

      flash.success = "Successfully shortened your URL!"
      phlex Views::Pages::Result.new(flash:, url:, base_url: request.base_url)
    end

    private

    #: -> String
    def generate_code
      code = SecureRandom.alphanumeric(5)
      url = Models::URL.find(code)
      return generate_code if url

      code
    end
  end
end
