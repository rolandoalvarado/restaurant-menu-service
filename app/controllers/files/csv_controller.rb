# frozen_string_literal: true

module Files
  class CsvController < ApplicationController
    def import
      result = FileServices::Import.new(params).process
      flash[:notice] = result[:message] if result.present?
      redirect_to root_path
    end

    def export
      result = FileServices::Export.new(params).process
      if result.present? && result[:status] == :unprocessable_entity
        flash[:notice] = result[:errors]
        render json: result.to_json, status: result[:status]
      else
        flash[:notice] = result[:message]
        send_data result[:data].to_json, type: 'application/json; charset=UTF-8;',
                                         disposition: 'attachment',
                                         filename: 'menus.json'
      end
    end
  end
end
