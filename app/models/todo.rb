# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :user

  has_rich_text :description

  validates :title, presence: true
end
