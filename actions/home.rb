# typed: strict
# frozen_string_literal: true

require_relative "base"
require_relative "../views/components/home"

module Actions
  class Home < Base
    get "/" do
      phlex Views::Components::Home.new
    end
  end
end
