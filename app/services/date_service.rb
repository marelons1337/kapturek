# frozen_string_literal: true

module DateService
  class << self
    def months_between_dates(from, to)
      (to.year * 12 + to.month) - (from.year * 12 + from.month)
    end
  end
end
