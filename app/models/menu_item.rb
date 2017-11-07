# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :dish
  belongs_to :menu_page

  validates :menu_page_id, :dish_id, presence: true
end
