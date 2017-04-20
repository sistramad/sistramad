class ProcedureFactory
  def build(code)
    case code
      when 'T-AS100'  then SabbaticalYear.new
      when 'T-AS101'  then ModifyWorkPlan.new
    end
  end 
end