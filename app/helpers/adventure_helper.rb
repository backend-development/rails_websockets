module AdventureHelper
  def describe_status(statuses)
    return nil if statuses.empty?

    statuses.each_with_index do |s, i|
      return "next up: step #{i + 1}" if s == 'not started'
      return "currently #{s} on step #{i + 1}" if %w(working blocked).include? s
    end

    'finished with everything'
  end
end
