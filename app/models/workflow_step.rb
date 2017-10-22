class WorkflowStep < ActiveRecord::Base
  include AASM
  belongs_to :request_workflow
  belongs_to :role
  has_one :review ,dependent: :destroy

  aasm column: "status" do    
  	
  	state :DR, :initial => true #DR stands for Drafted(Borrador)
  	state :IP, :AP, :RE, :CL 

  	event :procesar do
      transitions :from => :DR, :to => :IP
    end 

    event :aprobar do
      transitions :from => :IP, :to => :AP
    end 

    event :declinar do
      transitions :from => :IP, :to => :RE
    end

    event :cerrar do
      transitions :from => :RE, :to => :CL
    end 

    event :reset do
      transitions :from => [:IP,:AP,:RE], :to => :DR
    end

  end
end
