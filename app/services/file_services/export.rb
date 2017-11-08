# frozen_string_literal: true

module FileServices
  class Export
    SUCCESSFUL_EXPORT = 'File has been exported successfully.'
    INVALID_DATE_FROM = 'Date From is invalid!'

    def initialize(attrs)
      @attrs = attrs
    end

    def process
      process_file
    end

    private

    def process_file
      @place = @attrs[:place]
      @date_from = @attrs[:from].to_datetime
      @date_to = @attrs[:to].to_datetime

      if @date_from.to_i > @date_to.to_i
        result = { status: :unprocessable_entity, errors: INVALID_DATE_FROM }
      else
        result = { status: :ok, message: SUCCESSFUL_EXPORT, data: search_data }
      end
      result
    end

    def search_data
      Menu.where(place: @place, date: @date_from.beginning_of_day..@date_to.end_of_day)
    end
  end
end
