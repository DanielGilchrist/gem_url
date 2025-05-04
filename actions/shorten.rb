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

      valid_url = ensure_valid_url(original_url)

      if valid_url.nil?
        flash.failure = "#{original_url} is not a valid URL!"
        return redirect_home
      end

      code = generate_code
      url = Models::URL.insert(valid_url, code)

      flash.success = "Successfully shortened your URL!"
      phlex Views::Pages::Result.new(flash:, url:, base_url: request.base_url)
    end

    private

    #: (String url) -> String?
    def ensure_valid_url(url)
      http_url = if url.start_with?("http://", "https://")
        url
      else
        "https://#{url}"
      end

      parsed_url = parse_url(http_url)
      return unless parsed_url

      request = build_request(parsed_url)

      path = parsed_url.path
      path = "/" if path.nil? || path.empty?

      begin
        response = request.head(path)
        status = response.code.to_i
        parsed_url.to_s if status < 400
      rescue StandardError # TODO: More specific rescue
        nil
      end
    end

    #: (String url_string) -> URI::Generic?
    def parse_url(url_string)
      URI.parse(url_string)
    rescue URI::InvalidURIError
      nil
    end

    #: (URI::Generic url) -> Net::HTTP
    def build_request(url)
      Net::HTTP.new(url.host, url.port).tap do |request|
        request.use_ssl = (url.scheme == "https")
        request.open_timeout = 5
        request.read_timeout = 5
      end
    end

    #: -> String
    def generate_code
      code = SecureRandom.alphanumeric(5)
      url = Models::URL.find(code)
      return generate_code if url

      code
    end
  end
end
