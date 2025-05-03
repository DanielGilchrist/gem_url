# typed: strict
# frozen_string_literal: true

module Actions
  class Home < Base
    get "/" do
      phlex Views::Components::Home.new(flash:)
    end
  end
end
