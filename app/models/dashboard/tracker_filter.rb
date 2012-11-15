class Dashboard::TrackerFilter < Dashboard::Filter

  def initialize
    super(:tracker)
  end

  def scope(scope)
    value == :all ? scope : scope.where(:tracker_id => values)
  end

  def default_values
    [ :all ]
  end

  def update(params)
    return unless tracker = params[:tracker]

    if tracker == 'all'
      self.value = :all
    else
      self.value = tracker.to_i if board.project.trackers.where(:id => tracker.to_i).any?
    end
  end

  def title
    case value
    when :all then I18n.t(:dashboard_all_trackers)
    else board.project.trackers.find(value).name
    end
  end

  def to_options
    [
      [[I18n.t(:dashboard_all_trackers), :all]],
      board.project.trackers.map{|tracker| [tracker.name, tracker.id] }
    ]
  end
end