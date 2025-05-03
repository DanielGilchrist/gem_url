# typed: strict
# frozen_string_literal: true

module Actions
  class Home < Base
    get "/" do
      phlex Views::Pages::Home.new(flash:, base_url: request.base_url)
    end
  end
end
