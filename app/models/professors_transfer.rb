class ProfessorsTransfer < ActiveRecord::Base
  include AASM
  belongs_to :user
  #belongs_to :faculty, :foreign_key => 'faculty_from_id'
  #belongs_to :faculty, :foreign_key => 'faculty_to_id'
  has_one :request_workflow, dependent: :destroy
  has_many :workflow_steps, through: :request_workflow
  belongs_to :faculty_from, :class_name => 'Faculty', :foreign_key => 'faculty_from_id'
  belongs_to :faculty_to, :class_name => 'Faculty', :foreign_key => 'faculty_to_id'
  belongs_to :from, :class_name => 'ReferenceList', :foreign_key => 'faculty_from_id'
  belongs_to :to, :class_name => 'ReferenceList', :foreign_key => 'faculty_to_id'
  belongs_to :type, :class_name => 'Reference', :foreign_key => 'type_of_translate'
  belongs_to :type, :class_name => 'ReferenceList', :foreign_key => 'type_of_translate'
  belongs_to :process_type, :class_name => 'FormalitiesMaster', :foreign_key => 'process_type'
  accepts_nested_attributes_for :user
  has_many :attachments

  aasm column: "status" do    
  	
  	state :DR, :initial => true #DR stands for Drafted(Borrador)
  	state :IP, :AP, :RE, :CL 

  	event :procesar do
      transitions :from => :DR, :to => :IP
    end 

    event :aprobar do
      transitions :from => :IP, :to => :AP
    end 

    event :rechazar do
      transitions :from => :IP, :to => :RE
    end

    event :cerrar do
      transitions :from => :RE, :to => :CL
    end 

  end
end
