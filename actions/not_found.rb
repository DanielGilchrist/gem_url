# typed: strict
# frozen_string_literal: true

module Actions
  class NotFound < Base
    not_found do
      redirect_home
    end
  end
end
