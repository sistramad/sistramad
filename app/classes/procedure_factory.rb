class ProcedureFactory
  def build(code)
    case code
      when 'T-AS100'  then SabbaticalYear.new
      when 'T-AS101'  then ModifyWorkplan.new
      when 'T-AS102'  then PartialReport.new
      when 'T-AS103'  then FinalReport.new
      when 'T-AS104'  then DelaySabbaticalYear.new
      when 'T-AS105'  then SabbaticalYearReincorporation.new
        
      when 'T-SPF200' then FormationProgram.new
        
      when 'T-SPR201' then RotationPlan.new 
      when 'T-MPR202' then ModifyRotationPlan.new 
      when 'T-PPR203' then DelayRotationPlan.new

      when 'T-SLR204' then License.new
      when 'T-SPL205' then DelayLicense.new
      when 'T-SRL206' then LicenseReincorporation.new
    end
  end 
end