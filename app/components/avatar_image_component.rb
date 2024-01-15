# frozen_string_literal: true

class AvatarImageComponent < ApplicationComponent
  private attr_reader :image

  def initialize(image:)
    @image = image
  end

  protected

  def classnames(classes: '')
    tw(
      'aspect-square h-full w-full',
      classes
    )
  end
end
