# frozen_string_literal: true

module Files
  class CsvController < ApplicationController
    def import
      result = FileServices::Import.new(params).process
      flash[:notice] = result[:message] if result.present?
      redirect_to root_path
    end
  end
end
