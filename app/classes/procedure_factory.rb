class ProcedureFactory
  def build(code)
    case code
      when 'T-AS100'  then SabbaticalYear.new
      when 'T-OT100'  then Rectangle.new
    end
  end 
end