# frozen_string_literal: true

class AvatarComponent < ApplicationComponent
  def initialize
  end

  protected

  def classnames(classes: '')
    tw(
      'relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full',
      classes
    )
  end
end
