# typed: strict
# frozen_string_literal: true

module Actions
  class ShortCode < Base
    get "/:short_code" do
      code = params[:short_code]
      return 400 if code.blank?

      url = Models::URL.find(code)
      return 404 if url.nil?

      redirect url.original_url
    end
  end
end
