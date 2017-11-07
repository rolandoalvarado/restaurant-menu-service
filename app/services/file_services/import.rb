# frozen_string_literal: true

require 'csv'

module FileServices
  class Import
    include Benchmarking

    INVALID_FILE_TYPE = 'Invalid File type.'
    INVALID_CSV_TYPE = 'Invalid CSV type.'
    SUCCESSFUL_IMPORT = 'File has been imported successfully.'
    ERROR = 'An error occured while importing the file, please try again.'

    def initialize(attrs)
      @attrs = attrs
    end

    def process
      process_file
    end

    private

    def process_file
      file_ext = File.extname(@attrs[:file].original_filename)
      case file_ext
      when '.csv'
        process_csv
      # Uncomment 2 options below if you will permit .xls and .xlsx type.
      # when '.xls'
      # when '.xlsx'
      else
        return { status: :unprocessable_entity, message: INVALID_FILE_TYPE }
      end
    end

    # TODO: Need to refactor this.
    def process_csv
      csv_type = @attrs[:csv_type].first
      rows = []
      model_name = csv_type.constantize
      print_memory_usage do
        print_time_spent do
          CSV.foreach(@attrs[:file].path, headers: true) do |row|
            row_hash = row.to_h
            case csv_type
            when 'Dish'
              rows << model_name.new(row_hash) if row_hash['id'] && row_hash['name'].present?
            when 'Menu'
              unless row_hash['id'].nil? && row_hash['sponsor'].nil? &&
                row_hash['event'].nil? && row_hash['venue'].nil? && row_hash['place'].nil?
                rows << model_name.new(row_hash)
              end
            when 'MenuItem'
              unless row_hash['id'].nil? && row_hash['menu_page_id'].nil? &&
                row_hash['dish_id'].nil? && row_hash['price'].nil?
                rows << model_name.new(row_hash)
              end
            when 'MenuPage'
              unless row_hash['id'].nil? && row_hash['menu_id'].nil?
                rows << model_name.new(row_hash)
              end
            else
              return { status: :unprocessable_entity, message: INVALID_CSV_TYPE }
            end
          end # /CSV
        end # /print_time_spent
      end # /print_memory_usage

      model_name.import(rows)
      return { status: :ok, message: SUCCESSFUL_IMPORT }
    rescue => error
      Rails.logger.info "Actual error : #{error.inspect}"
      return { status: :unprocessable_entity, message: ERROR }
    end
  end
end
