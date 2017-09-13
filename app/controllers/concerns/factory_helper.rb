module FactoryHelper
  extend ActiveSupport::Concern

  def get_procedure_from_factory(procedure_code)
    factory = ProcedureFactory.new
    factory.build(procedure_code)
  end
  
end