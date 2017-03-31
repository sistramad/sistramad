class ProcedureFactory
  def build(code)
    case code
      when 'T-AS100'  then SabbaticalYear.new
    end
  end 
end