module ApplicationHelper
  
  def state_translate(state)
    state_map = {'in_draft' => 'En borrador', 'in_progress' => 'En progreso'}
    state_map[state]
  end

end
