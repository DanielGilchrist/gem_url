# typed: strict
# frozen_string_literal: true

RubyVM::YJIT.enable

require_relative "app"
run App
