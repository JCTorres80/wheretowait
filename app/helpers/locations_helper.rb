module LocationsHelper

  def summary_calculation_by_sub_group questions, location
    summary = {}
    questions.each do |question|
      item = summary[question.sub_group]
      if item.nil?
        item = {:qty => 0, :value => 0, :total_value => 0, :sub_group => question.sub_group, :sub_group_unit => question.sub_group_unit}
        summary[question.sub_group] = item
      end
      item[:qty] += 1
      if question.unit == '%'
        item[:value] += determine_value_for_percentage question.average_value_by_location(@location)
        item[:total_value] += determine_value_for_percentage question.average_value
      else
        item[:value] += question.average_value_by_location(@location)
        item[:total_value] += question.average_value
      end
    end
    items = []
    summary.each do |item|
      line_item = item[1]
      line_item[:avg_value] = line_item[:value] / line_item[:qty]
      line_item[:avg_total_value] = line_item[:total_value] / line_item[:qty]
      items.push line_item
    end
    items
  end

  def determine_value_for_percentage percentage
    if percentage <= 5
      return 1
    elsif 5 < percentage && percentage <= 10
      return 2
    elsif 10 < percentage && percentage <= 15
      return 3
    elsif 15 < percentage && percentage <= 20
      return 4
    elsif 20 < percentage
      return 5
    end
  end

  def show_formatted_result unit, value
    unless unit.empty?
      return value.round(2).to_s+' '+unit
    end
    min = value.floor
    half = value - value.floor > 0.5 ? 1 : 0
    max = 5 - value.floor - half
    filled_stars = '<i class="fa fa-star"></i>' * min
    half_stars = '<i class="fa fa-star-half-o"></i>' * half
    empty_stars = '<i class="fa fa-star-o"></i>' * max
    filled_stars + half_stars + empty_stars
  end

end
