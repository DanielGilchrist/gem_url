# typed: strict
# frozen_string_literal: true

require_relative "app"

RubyVM::YJIT.enable
run App
