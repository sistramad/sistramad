class OtherProcedure < Procedure
  def initialize
    @name = "Otro Trámite"
    @code = "T-OT100"
  end

  def validate_requirements
    puts "Other Procedure validations"
  end
  
end