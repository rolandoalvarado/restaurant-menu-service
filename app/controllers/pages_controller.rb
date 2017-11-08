# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @menus = Menu.select(:place).distinct if current_user
  end
end
