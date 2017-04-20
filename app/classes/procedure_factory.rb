class ProcedureFactory
  def build(code)
    case code
      when 'T-AS100'  then SabbaticalYear.new
      when 'T-AS101'  then ModifyWorkplan.new
    end
  end 
end