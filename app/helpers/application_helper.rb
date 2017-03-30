module ApplicationHelper
  
  def state_translate(state)
    STATE_MAP[state]
  end

end
