class SabbaticalYear < SystemProcedure
  attr_accessor :name
  attr_accessor :code

  def initialize     
    @name = "Año Sabatico"
    @code = "T-AS100"
  end

  def pre_requirements_valid?
    puts "Sabbatical Year Validations 1"
    puts "Sabbatical Year Validations 2"
    puts "Sabbatical Year Validations 3"
    true
  end
  
end