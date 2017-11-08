# frozen_string_literal: true

require 'benchmark'

module Benchmarking
  def print_memory_usage
    memory_before = `ps -o rss= -p #{Process.pid}`.to_i
    yield
    memory_after = `ps -o rss= -p #{Process.pid}`.to_i

    Rails.logger.info "Memory Usage: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
  end

  def print_time_spent
    time = Benchmark.realtime do
      yield
    end

    Rails.logger.info "Time Spent: #{time.round(2)} seconds"
  end
end
