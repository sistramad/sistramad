module AdminProceduresHelper
  def basic_info_view(code)
    case code
      when 'T-AS100' , 'T-AS101' , 'T-AS102' , 'T-AS103' , 'T-AS104' , 'T-AS105' then  
        return 'procedures/basic_info'     
      when 'T-SPF200' then 
        return 'special_formation_procedures/basic_info'
      when 'T-SPR201' then  
        return 'rotation_plans/basic_info'
      when 'T-MPR202' then 
        return 'modify_rotation_plans/basic_info'
      when 'T-PPR203' then 
        return 'delay_rotation_plans/basic_info'
      when 'T-SLR204' then 
        return 'licenses/basic_info'
      when 'T-SPL205' then 
        return 'delay_licenses/basic_info'
      when 'T-SRL206' then 
        return 'license_reincorporations/basic_info'
    end
  end

  def steps_approved?(steps)
    steps.each do |step|
      unless @procedure.steps.find_by(name: step).approved?
        return false
      end
    end
    return true
  end

  def step_approved?(step_name)
    @procedure.steps.find_by(name: step_name).approved?
  end


end
