# frozen_string_literal: true

class NavbarComponent < ApplicationComponent
  attr_reader :user

  def initialize(user:)
    @user = user
  end
end
