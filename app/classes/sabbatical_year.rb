class SabbaticalYear < SystemProcedure
  attr_accessor :name
  attr_accessor :code

  def initialize     
    @name = "Año Sabatico"
    @code = "T-AS100"
  end

  def requirements_valid?
    puts "Sabbatical Year Validations"
    puts "Sabbatical Year Validations"
    puts "Sabbatical Year Validations"
    true
  end
  
end