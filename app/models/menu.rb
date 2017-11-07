# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_pages, dependent: :destroy

  validates :sponsor, :event, :venue, :place, presence: true
end
