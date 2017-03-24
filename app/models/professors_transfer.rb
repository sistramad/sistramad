class ProfessorsTransfer < ActiveRecord::Base
  include AASM
  belongs_to :user
  #belongs_to :faculty, :foreign_key => 'faculty_from_id'
  #belongs_to :faculty, :foreign_key => 'faculty_to_id'
  belongs_to :faculty_from, :class_name => 'Faculty', :foreign_key => 'faculty_from_id'
  belongs_to :faculty_to, :class_name => 'Faculty', :foreign_key => 'faculty_to_id'
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
