module AdminProceduresHelper
  def basic_info_view(code)
    if (code == ('T-AS100' || 'T-AS101' ))
      return 'procedures/basic_info'
    elsif (code == 'T-SPF200')
      return 'special_formation_procedures/basic_info'
    elsif (code == 'T-SPR201')
      return 'rotation_plans/basic_info'
    end
  end
end
