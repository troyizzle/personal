# frozen_string_literal: true

class FormErrorsComponent < ApplicationComponent
  private attr_reader :form

  def initialize(form:)
    @form = form
  end

  def render?
    form.object.errors.any?
  end
end
