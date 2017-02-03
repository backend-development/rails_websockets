module AdventureHelper
  def describe_status(statuses)
    return nil if statuses.empty?

    # first scan: find firest step that is not started or that we are working on
    statuses.each_with_index do |s, i|
      return "next up: step #{i + 1}" if s == 'not_started'
      return "currently #{s} on step #{i + 1}" if %w(working).include? s
    end

    # second scan: find first step that is blocked
    statuses.each_with_index do |s, i|
      return "next up: step #{i + 1}" if s == 'blocked'
    end

    # else
    'finished with everything'
  end

  def current_step(statuses)
    return nil if statuses.nil?
    return nil if statuses.empty?
    statuses.each_with_index do |s, i|
      return i if %w(working not_started).include? s
    end
    statuses.each_with_index do |s, i|
      return i if %w(blocked).include? s
    end    
    statuses.length
  end

  def class_for_step(i, current_step, statuses)
    classes = [ "step_#{i}"]
    if statuses.nil? or statuses.empty? or statuses[i].nil?
      classes.push 'not_started'
    else
      classes.push statuses[i]
    end

    if current_step.nil?
      # skip this
    elsif i < current_step
      classes.push 'past_step'
    elsif i == current_step
      classes.push 'current_step'
    else
      classes.push 'future_step'
    end

    classes.join(' ')
  end
end
